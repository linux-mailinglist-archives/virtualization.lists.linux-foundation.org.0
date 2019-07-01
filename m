Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 023DA20B19
	for <lists.virtualization@lfdr.de>; Thu, 16 May 2019 17:25:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 730B0C3A;
	Thu, 16 May 2019 15:25:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 877A8AF5
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 15:25:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 117F084F
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 15:25:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 71315306641B;
	Thu, 16 May 2019 15:25:38 +0000 (UTC)
Received: from localhost (ovpn-117-183.ams2.redhat.com [10.36.117.183])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23C4D60851;
	Thu, 16 May 2019 15:25:34 +0000 (UTC)
Date: Thu, 16 May 2019 16:25:33 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2 1/8] vsock/virtio: limit the memory used per-socket
Message-ID: <20190516152533.GB29808@stefanha-x1.localdomain>
References: <20190510125843.95587-1-sgarzare@redhat.com>
	<20190510125843.95587-2-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190510125843.95587-2-sgarzare@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 16 May 2019 15:25:38 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	"David S. Miller" <davem@davemloft.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3391420627472694929=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============3391420627472694929==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2019 at 02:58:36PM +0200, Stefano Garzarella wrote:
> +struct virtio_vsock_buf {

Please add a comment describing the purpose of this struct and to
differentiate its use from struct virtio_vsock_pkt.

> +static struct virtio_vsock_buf *
> +virtio_transport_alloc_buf(struct virtio_vsock_pkt *pkt, bool zero_copy)
> +{
> +	struct virtio_vsock_buf *buf;
> +
> +	if (pkt->len =3D=3D 0)
> +		return NULL;
> +
> +	buf =3D kzalloc(sizeof(*buf), GFP_KERNEL);
> +	if (!buf)
> +		return NULL;
> +
> +	/* If the buffer in the virtio_vsock_pkt is full, we can move it to
> +	 * the new virtio_vsock_buf avoiding the copy, because we are sure that
> +	 * we are not use more memory than that counted by the credit mechanism.
> +	 */
> +	if (zero_copy && pkt->len =3D=3D pkt->buf_len) {
> +		buf->addr =3D pkt->buf;
> +		pkt->buf =3D NULL;
> +	} else {
> +		buf->addr =3D kmalloc(pkt->len, GFP_KERNEL);

buf and buf->addr could be allocated in a single call, though I'm not
sure how big an optimization this is.

> @@ -841,20 +882,24 @@ virtio_transport_recv_connected(struct sock *sk,
>  {
>  	struct vsock_sock *vsk =3D vsock_sk(sk);
>  	struct virtio_vsock_sock *vvs =3D vsk->trans;
> +	struct virtio_vsock_buf *buf;
>  	int err =3D 0;
> =20
>  	switch (le16_to_cpu(pkt->hdr.op)) {
>  	case VIRTIO_VSOCK_OP_RW:
>  		pkt->len =3D le32_to_cpu(pkt->hdr.len);
> -		pkt->off =3D 0;
> +		buf =3D virtio_transport_alloc_buf(pkt, true);
> =20
> -		spin_lock_bh(&vvs->rx_lock);
> -		virtio_transport_inc_rx_pkt(vvs, pkt);
> -		list_add_tail(&pkt->list, &vvs->rx_queue);
> -		spin_unlock_bh(&vvs->rx_lock);
> +		if (buf) {
> +			spin_lock_bh(&vvs->rx_lock);
> +			virtio_transport_inc_rx_pkt(vvs, pkt->len);
> +			list_add_tail(&buf->list, &vvs->rx_queue);
> +			spin_unlock_bh(&vvs->rx_lock);
> =20
> -		sk->sk_data_ready(sk);
> -		return err;
> +			sk->sk_data_ready(sk);
> +		}

The return value of this function isn't used but the code still makes an
effort to return errors.  Please return -ENOMEM when buf =3D=3D NULL.

If you'd like to remove the return value that's fine too, but please do
it for the whole function to be consistent.

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAlzdgO0ACgkQnKSrs4Gr
c8i2BQf/SKch1qy6NDC+HDYgEJxI8sLacx7MgcaTqQGmvc29mZInkaMMDj88G6T/
LGW/vJZ1x1ZPrLx+fKiNOs82ZIiiHhLy8HGEjuu8eMW+YYk0y8QPu7QPsxRV2IaG
u7gSGPxdUKUvGVejNWyqo5/mW2kZOLaMg0Z5zTghUhZ9hLyBQAU5UwvdqVICnedh
1IYkF86rZrfKQFZCv/X5Q7IwRvg1lHZyYjTyqUBomc2z1tAk4t1NrMT3LDhLD1XZ
dnUdBc5bBVspwArnAl9P4Uag0Gjh8yjEp0S7ITrZI58G6tilDb3cncv9w+nRvQks
EY4F99igT+SAp97NrMrIW0E/MZjnOw==
=gdG0
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--

--===============3391420627472694929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3391420627472694929==--
