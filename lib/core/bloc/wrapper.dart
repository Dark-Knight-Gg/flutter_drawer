class Wrapper<V> {
  final V? value;

  const Wrapper.value(this.value);

  const Wrapper.vNull() : this.value(null);
}
