Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EE3AB7A7
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 14:03:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EF6322166;
	Fri,  6 Sep 2019 12:03:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 570762153
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 12:03:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EC0667DB
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 12:03:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7EC002F30C1;
	Fri,  6 Sep 2019 12:03:11 +0000 (UTC)
Received: from localhost (ovpn-117-208.ams2.redhat.com [10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB1B05D784;
	Fri,  6 Sep 2019 12:03:10 +0000 (UTC)
Date: Fri, 6 Sep 2019 13:03:09 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 15/18] virtiofs: Make virtio_fs object refcounted
Message-ID: <20190906120309.GW5900@stefanha-x1.localdomain>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<20190905194859.16219-16-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190905194859.16219-16-vgoyal@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 06 Sep 2019 12:03:11 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: miklos@szeredi.hu, mst@redhat.com, linux-kernel@vger.kernel.org,
	dgilbert@redhat.com, virtio-fs@redhat.com, linux-fsdevel@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============8343446716509938884=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============8343446716509938884==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fCmRXBY78W5odcVA"
Content-Disposition: inline


--fCmRXBY78W5odcVA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2019 at 03:48:56PM -0400, Vivek Goyal wrote:
> This object is used both by fuse_connection as well virt device. So make
> this object reference counted and that makes it easy to define life cycle
> of the object.
>=20
> Now deivce can be removed while filesystem is still mounted. This will
> cleanup all the virtqueues but virtio_fs object will still be around and
> will be cleaned when filesystem is unmounted and sb/fc drops its referenc=
e.
>=20
> Removing a device also stops all virt queues and any new reuqest gets
> error -ENOTCONN. All existing in flight requests are drained before
> ->remove returns.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  fs/fuse/virtio_fs.c | 52 +++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 43 insertions(+), 9 deletions(-)
>=20
> diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
> index 01bbf2c0e144..29ec2f5bbbe2 100644
> --- a/fs/fuse/virtio_fs.c
> +++ b/fs/fuse/virtio_fs.c
> @@ -37,6 +37,7 @@ struct virtio_fs_vq {
> =20
>  /* A virtio-fs device instance */
>  struct virtio_fs {
> +	struct kref refcount;
>  	struct list_head list;    /* on virtio_fs_instances */
>  	char *tag;
>  	struct virtio_fs_vq *vqs;
> @@ -63,6 +64,27 @@ static inline struct fuse_pqueue *vq_to_fpq(struct vir=
tqueue *vq)
>  	return &vq_to_fsvq(vq)->fud->pq;
>  }
> =20
> +static void release_virtiofs_obj(struct kref *ref)
> +{
> +	struct virtio_fs *vfs =3D container_of(ref, struct virtio_fs, refcount);
> +
> +	kfree(vfs->vqs);
> +	kfree(vfs);
> +}
> +
> +static void virtiofs_put(struct virtio_fs *fs)

Why do the two function names above contain "virtiofs" instead
of "virtio_fs"?  I'm not sure if this is intentional and is supposed to
mean something, but it's confusing.

> +{
> +	mutex_lock(&virtio_fs_mutex);
> +	kref_put(&fs->refcount, release_virtiofs_obj);
> +	mutex_unlock(&virtio_fs_mutex);
> +}
> +
> +static void virtio_fs_put(struct fuse_iqueue *fiq)

Minor issue: this function name is confusingly similar to
virtiofs_put().  Please rename to virtio_fs_fiq_put().

--fCmRXBY78W5odcVA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1ySv0ACgkQnKSrs4Gr
c8gi5QgAiBUMFExTxgTgb6RrUfkYvhvR0YjuN8ik/lgPSvOOVMtT6LMM77ysQauR
LdWnlChQQCMbdamE0Z1RjdPlj461cs3RjPH7QHZtimEOeYBUQegMuOx2aPcLj55u
LCaJauSLzpxYlNKcEFKlmrfaVNAoFRFcFMsAUt5qekoK1mhtcFQ1TYwXyJdqObUY
sYK5tPk2nJvMkeRHr84V8fpI0WiyQU+6okJnEfNUYmx+p1qn7VjIPsGq+Yz4MLF8
baWiJFLjWRFvW6STaaams5Yx4VI3jNtUI7qvikpuOkYWzwQfvv6qbH/RDYk5j5d1
/yxvM1H6W/rDyI1qYOi1etkBab+HEg==
=p10d
-----END PGP SIGNATURE-----

--fCmRXBY78W5odcVA--

--===============8343446716509938884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8343446716509938884==--
