using Godot;
using System;

public partial class Player : CharacterBody3D
{
  [Export] public float Speed = 5.0f;

  public override void _PhysicsProcess(double delta)
  {
    Vector3 input = new(
        Input.GetActionStrength("move_right") - Input.GetActionStrength("move_left"),
        0,
        Input.GetActionStrength("move_back") - Input.GetActionStrength("move_forward")
    );

    Velocity = input.Normalized() * Speed;
    MoveAndSlide();
  }
}
