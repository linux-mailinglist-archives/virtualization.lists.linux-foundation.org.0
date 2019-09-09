Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D40ADCD4
	for <lists.virtualization@lfdr.de>; Mon,  9 Sep 2019 18:13:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C035BB1F;
	Mon,  9 Sep 2019 16:13:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A6E6E255
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 16:13:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 20E578B6
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 16:13:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E31618C4274;
	Mon,  9 Sep 2019 16:13:27 +0000 (UTC)
Received: from localhost (ovpn-117-107.ams2.redhat.com [10.36.117.107])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CB4345D721;
	Mon,  9 Sep 2019 16:13:19 +0000 (UTC)
Date: Mon, 9 Sep 2019 18:13:05 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 16/18] virtiofs: Use virtio_fs_mutex for races w.r.t
	->remove and mount path
Message-ID: <20190909161305.GF20875@stefanha-x1.localdomain>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<20190905194859.16219-17-vgoyal@redhat.com>
	<20190906120534.GX5900@stefanha-x1.localdomain>
	<20190906135131.GE22083@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190906135131.GE22083@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.62]);
	Mon, 09 Sep 2019 16:13:27 +0000 (UTC)
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
Content-Type: multipart/mixed; boundary="===============2607737890766387973=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============2607737890766387973==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QXO0/MSS4VvK6f+D"
Content-Disposition: inline


--QXO0/MSS4VvK6f+D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 06, 2019 at 09:51:31AM -0400, Vivek Goyal wrote:
> On Fri, Sep 06, 2019 at 01:05:34PM +0100, Stefan Hajnoczi wrote:
> > On Thu, Sep 05, 2019 at 03:48:57PM -0400, Vivek Goyal wrote:
> > > It is possible that a mount is in progress and device is being remove=
d at
> > > the same time. Use virtio_fs_mutex to avoid races.
> > >=20
> > > This also takes care of bunch of races and removes some TODO items.
> > >=20
> > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > ---
> > >  fs/fuse/virtio_fs.c | 32 ++++++++++++++++++++++----------
> > >  1 file changed, 22 insertions(+), 10 deletions(-)
> >=20
> > Let's move to a per-device mutex in the future.  That way a single
> > device that fails to drain/complete requests will not hang all other
> > virtio-fs instances.  This is fine for now.
>=20
> Good point. For now I updated the patch so that it applies cleanly
> after previous two patches changed.
>=20
> Subject: virtiofs: Use virtio_fs_mutex for races w.r.t ->remove and mount=
 path
>=20
> It is possible that a mount is in progress and device is being removed at
> the same time. Use virtio_fs_mutex to avoid races.=20
>=20
> This also takes care of bunch of races and removes some TODO items.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  fs/fuse/virtio_fs.c |   32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)
>=20
> Index: rhvgoyal-linux-fuse/fs/fuse/virtio_fs.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- rhvgoyal-linux-fuse.orig/fs/fuse/virtio_fs.c	2019-09-06 09:40:53.3092=
45246 -0400
> +++ rhvgoyal-linux-fuse/fs/fuse/virtio_fs.c	2019-09-06 09:43:25.335245246=
 -0400
> @@ -13,7 +13,9 @@
>  #include <linux/highmem.h>
>  #include "fuse_i.h"
> =20
> -/* List of virtio-fs device instances and a lock for the list */
> +/* List of virtio-fs device instances and a lock for the list. Also prov=
ides
> + * mutual exclusion in device removal and mounting path
> + */
>  static DEFINE_MUTEX(virtio_fs_mutex);
>  static LIST_HEAD(virtio_fs_instances);
> =20
> @@ -72,17 +74,19 @@ static void release_virtio_fs_obj(struct
>  	kfree(vfs);
>  }
> =20
> +/* Make sure virtiofs_mutex is held */
>  static void virtio_fs_put(struct virtio_fs *fs)
>  {
> -	mutex_lock(&virtio_fs_mutex);
>  	kref_put(&fs->refcount, release_virtio_fs_obj);
> -	mutex_unlock(&virtio_fs_mutex);
>  }
> =20
>  static void virtio_fs_fiq_release(struct fuse_iqueue *fiq)
>  {
>  	struct virtio_fs *vfs =3D fiq->priv;
> +
> +	mutex_lock(&virtio_fs_mutex);
>  	virtio_fs_put(vfs);
> +	mutex_unlock(&virtio_fs_mutex);
>  }
> =20
>  static void virtio_fs_drain_queue(struct virtio_fs_vq *fsvq)
> @@ -596,9 +600,8 @@ static void virtio_fs_remove(struct virt
>  	struct virtio_fs *fs =3D vdev->priv;
> =20
>  	mutex_lock(&virtio_fs_mutex);
> +	/* This device is going away. No one should get new reference */
>  	list_del_init(&fs->list);
> -	mutex_unlock(&virtio_fs_mutex);
> -
>  	virtio_fs_stop_all_queues(fs);
>  	virtio_fs_drain_all_queues(fs);
>  	vdev->config->reset(vdev);
> @@ -607,6 +610,7 @@ static void virtio_fs_remove(struct virt
>  	vdev->priv =3D NULL;
>  	/* Put device reference on virtio_fs object */
>  	virtio_fs_put(fs);
> +	mutex_unlock(&virtio_fs_mutex);
>  }
> =20
>  #ifdef CONFIG_PM_SLEEP
> @@ -978,10 +982,15 @@ static int virtio_fs_fill_super(struct s
>  		.no_force_umount =3D true,
>  	};
> =20
> -	/* TODO lock */
> -	if (fs->vqs[VQ_REQUEST].fud) {
> -		pr_err("virtio-fs: device already in use\n");
> -		err =3D -EBUSY;
> +	mutex_lock(&virtio_fs_mutex);
> +
> +	/* After holding mutex, make sure virtiofs device is still there.
> +	 * Though we are holding a refernce to it, drive ->remove might
> +	 * still have cleaned up virtual queues. In that case bail out.
> +	 */
> +	err =3D -EINVAL;
> +	if (list_empty(&fs->list)) {
> +		pr_info("virtio-fs: tag <%s> not found\n", fs->tag);
>  		goto err;
>  	}
> =20
> @@ -1007,7 +1016,6 @@ static int virtio_fs_fill_super(struct s
> =20
>  	fc =3D fs->vqs[VQ_REQUEST].fud->fc;
> =20
> -	/* TODO take fuse_mutex around this loop? */
>  	for (i =3D 0; i < fs->nvqs; i++) {
>  		struct virtio_fs_vq *fsvq =3D &fs->vqs[i];
> =20
> @@ -1020,6 +1028,7 @@ static int virtio_fs_fill_super(struct s
>  	/* Previous unmount will stop all queues. Start these again */
>  	virtio_fs_start_all_queues(fs);
>  	fuse_send_init(fc, init_req);
> +	mutex_unlock(&virtio_fs_mutex);
>  	return 0;
> =20
>  err_free_init_req:
> @@ -1027,6 +1036,7 @@ err_free_init_req:
>  err_free_fuse_devs:
>  	virtio_fs_free_devs(fs);
>  err:
> +	mutex_unlock(&virtio_fs_mutex);
>  	return err;
>  }
> =20
> @@ -1100,7 +1110,9 @@ static int virtio_fs_get_tree(struct fs_
> =20
>  	fc =3D kzalloc(sizeof(struct fuse_conn), GFP_KERNEL);
>  	if (!fc) {
> +		mutex_lock(&virtio_fs_mutex);
>  		virtio_fs_put(fs);
> +		mutex_unlock(&virtio_fs_mutex);
>  		return -ENOMEM;
>  	}
> =20
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--QXO0/MSS4VvK6f+D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl12ehEACgkQnKSrs4Gr
c8gZdAf+IVNbH4Xj7qYvhKiKubJpydyeir1MhaHFmLiu+i4vUSwpC/e0evU8fVmE
JpzNrXs4AKEMM+1rbzFk9dYjBTujGi6+L9yRoXZckuxlSgwP2jIXs75Eui2Aik4S
/79a+4ywNATEpnQ1Gjr0Lqi3CnaHkawWjW9bd4ZDSIuXZyhWHmQSNFjaXSdC4f/i
Ox7k5tGFdIBmqg/kMEhyIcuTH/bqBGY1ZAdAygwSpY6iUed0vnyMdscG3HjwHXNu
EIWuAsdKVqbrNQfhNNNtRTlzwtgTKBIuSiG58zNkUIox5HbGwfeQLalH6v8rpAHl
GO7BQzUR0tbYOWKUsgZafdY6nldfBQ==
=L72n
-----END PGP SIGNATURE-----

--QXO0/MSS4VvK6f+D--

--===============2607737890766387973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2607737890766387973==--
