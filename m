Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2531E3B8069
	for <lists.virtualization@lfdr.de>; Wed, 30 Jun 2021 11:52:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD01183AFA;
	Wed, 30 Jun 2021 09:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 51pyyCTJAGqt; Wed, 30 Jun 2021 09:51:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 87513827D2;
	Wed, 30 Jun 2021 09:51:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21440C000E;
	Wed, 30 Jun 2021 09:51:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60FE5C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 09:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 429FE83AF1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 09:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rCVr0tOrW3dl
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 09:51:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8260D827D2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 09:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625046714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QLDSo2Z7zKdGrAmZB3cGG4Cv4LLSWVrxocNgHWfsXbw=;
 b=O48PEsgZoeO56/BWKb0WwitiV4I3AmVVKZIC99zw39RgteLkwrC0l0CnSOozHN11JibvQV
 T7JFCDxfNB9JK/A2S0mpgphfQZkgADJNSVenRrNMacDYRFJKMy9vRLnjYZ/1DW0ZkC358/
 ADyD+KaARMzeJo50PGfABl8s2t2pUYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-Oc54HgY3P36dWKvzQqTIHA-1; Wed, 30 Jun 2021 05:51:52 -0400
X-MC-Unique: Oc54HgY3P36dWKvzQqTIHA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 241B31023F44;
 Wed, 30 Jun 2021 09:51:49 +0000 (UTC)
Received: from localhost (ovpn-113-77.ams2.redhat.com [10.36.113.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6063060C17;
 Wed, 30 Jun 2021 09:51:40 +0000 (UTC)
Date: Wed, 30 Jun 2021 10:51:39 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Subject: Re: Re: [PATCH v8 09/10] vduse: Introduce VDUSE - vDPA Device in
 Userspace
Message-ID: <YNw+q/ADMPviZi6S@stefanha-x1.localdomain>
References: <20210615141331.407-1-xieyongji@bytedance.com>
 <20210615141331.407-10-xieyongji@bytedance.com>
 <YNSatrDFsg+4VvH4@stefanha-x1.localdomain>
 <CACycT3vaXQ4dxC9QUzXXJs7og6TVqqVGa8uHZnTStacsYAiFwQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACycT3vaXQ4dxC9QUzXXJs7og6TVqqVGa8uHZnTStacsYAiFwQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: kvm <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Christian Brauner <christian.brauner@canonical.com>,
 Jonathan Corbet <corbet@lwn.net>, joro@8bytes.org,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Al Viro <viro@zeniv.linux.org.uk>,
 songmuchun@bytedance.com, Jens Axboe <axboe@kernel.dk>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 bcrl@kvack.org, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Mika =?iso-8859-1?Q?Penttil=E4?= <mika.penttila@nextfour.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2088035131554035454=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


--===============2088035131554035454==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3lbE45OiRHDOxQny"
Content-Disposition: inline


--3lbE45OiRHDOxQny
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 29, 2021 at 10:59:51AM +0800, Yongji Xie wrote:
> On Mon, Jun 28, 2021 at 9:02 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >
> > On Tue, Jun 15, 2021 at 10:13:30PM +0800, Xie Yongji wrote:
> > > +/* ioctls */
> > > +
> > > +struct vduse_dev_config {
> > > +     char name[VDUSE_NAME_MAX]; /* vduse device name */
> > > +     __u32 vendor_id; /* virtio vendor id */
> > > +     __u32 device_id; /* virtio device id */
> > > +     __u64 features; /* device features */
> > > +     __u64 bounce_size; /* bounce buffer size for iommu */
> > > +     __u16 vq_size_max; /* the max size of virtqueue */
> >
> > The VIRTIO specification allows per-virtqueue sizes. A device can have
> > two virtqueues, where the first one allows up to 1024 descriptors and
> > the second one allows only 128 descriptors, for example.
> >
>=20
> Good point! But it looks like virtio-vdpa/virtio-pci doesn't support
> that now. All virtqueues have the same maximum size.

I see struct vpda_config_ops only supports a per-device max vq size:
u16 (*get_vq_num_max)(struct vdpa_device *vdev);

virtio-pci supports per-virtqueue sizes because the struct
virtio_pci_common_cfg->queue_size register is per-queue (controlled by
queue_select).

I guess this is a question for Jason: will vdpa will keep this limitation?
If yes, then VDUSE can stick to it too without running into problems in
the future.

> > > +     __u16 padding; /* padding */
> > > +     __u32 vq_num; /* the number of virtqueues */
> > > +     __u32 vq_align; /* the allocation alignment of virtqueue's meta=
data */
> >
> > I'm not sure what this is?
> >
>=20
>  This will be used by vring_create_virtqueue() too.

If there is no official definition for the meaning of this value then
"/* same as vring_create_virtqueue()'s vring_align parameter */" would
be clearer. That way the reader knows what to research in order to
understand how this field works.

I don't remember but maybe it was used to support vrings when the
host/guest have non-4KB page sizes. I wonder if anyone has an official
definition for this value?

--3lbE45OiRHDOxQny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDcPqsACgkQnKSrs4Gr
c8gDoggAyGvIGHHs1axRrEGCyXosmMHq1Gwk1Dsg+k0v8U5j732fua4fJO5b2bGG
pzNxnV9FTNjogQfNxCplXlHf7caNNcC3DP+ICiJHaltNBj4xyNF+DB4DiUUgzX+b
5OnyW39vt7baCjK8ArMUXRW7FAWMPyws++y74Gagc5jIG7ZBaXUQDXr00eIgOYo7
ltAOLwHViZ7uNrXo7ohWRZpsBQkm2P8Hk7JNlxoQTjTKAp3kQ9eRdVR9/TrU0srE
vZ6KxlGFgDlyd1lzWOh19y/MS2uhN2guJXrhqsF/2lOMh6v8qcHGKgdFCYJNctFq
M0jd7vfZKILkd4ychd1eColy0HVSNw==
=3k6c
-----END PGP SIGNATURE-----

--3lbE45OiRHDOxQny--


--===============2088035131554035454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2088035131554035454==--

