Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C3BD68A8
	for <lists.virtualization@lfdr.de>; Mon, 14 Oct 2019 19:39:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A03162732;
	Mon, 14 Oct 2019 17:39:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EF0A223F6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 17:39:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6ECAB821
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 17:39:46 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f22so17575793wmc.2
	for <virtualization@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 10:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lNZVpaEdmaJY1w+xpL+K9ZqQ92uD6Jfe5E6lniBjnvM=;
	b=oY+W6FwfNZXtwQq+WhORdLOdfo+f4fhwM0p+Ers5h6CPfgtbEn9ww93kXBSsw2v60b
	SMIu2UNR6PLQJQdTuB5CZKPD7tjM5zgAWc2F3LP1dYBp/mIWLyzvE+gzbroEFBRI7Dst
	6kA8qKfdBDN33wxGZAOv+JGy3RovTItDZE4cjypr4TRa0AKUIYcxwviSXAuFpdNyQ3Ic
	P5h5NDYnWvzIBkjBiYMxqf/jo1ONlCR+e27uF8WQwLTB2ZtajymWafYs1NlkszKw2+og
	TjPkHU05jpgk0QnsRcXQ7aScuZgRRwSgOc6g7Xs1OdMStDrlfb3Y5KlSoZ09BW/JEGMk
	I4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lNZVpaEdmaJY1w+xpL+K9ZqQ92uD6Jfe5E6lniBjnvM=;
	b=eg9RaBEWbUpM2LoZ2CAiX8N3K+FRIjqagm3RpEy/4ufuFwqgJBrJzJOHkRU6gvYsws
	NyXF9/It+a1s4okWpt2vXOy5cja48yo6rN6kUOBfj9zaQ2yZf1ehML/oecclsvFQqzM5
	+UgOnT1qrR+IC0vEr5jCXH6+9Yd0Ahpw3LBKsdeuU6Xwx7mN9FnM47/A59qiqyLDykCJ
	kaRvXQ/+wo1fu6c9xKee4Axl7JMnxeDf4XjMCwIku0Xc1t9l0JG9tFu9WNOveBePmUmL
	dbEfen2Ad7LvQudVKm0kw36JUgCtKHxErB7zWzhJfG19kmDcHcRBUDIFsua3mdVP+2QX
	XP3Q==
X-Gm-Message-State: APjAAAWUai2UyOclkg11xY6kgKizTM7kXv2eXupbCo8jzP95ZIz1EHhb
	QeU3vKjVcTo6KYrun4bDOYc=
X-Google-Smtp-Source: APXvYqxufY2enniRnRIxytq9WOwNI0dKAeSWrxef8cqdYzIseEmMuayKHSwg/1yhpjk+WboQkw4UeQ==
X-Received: by 2002:a1c:bc07:: with SMTP id m7mr16018252wmf.117.1571074784999; 
	Mon, 14 Oct 2019 10:39:44 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id p5sm25687450wmi.4.2019.10.14.10.39.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Oct 2019 10:39:44 -0700 (PDT)
Date: Mon, 14 Oct 2019 18:39:42 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V3 6/7] virtio: introduce a mdev based transport
Message-ID: <20191014173942.GB5359@stefanha-x1.localdomain>
References: <20191011081557.28302-1-jasowang@redhat.com>
	<20191011081557.28302-7-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191011081557.28302-7-jasowang@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: christophe.de.dinechin@gmail.com, kvm@vger.kernel.org, mst@redhat.com,
	airlied@linux.ie, joonas.lahtinen@linux.intel.com,
	heiko.carstens@de.ibm.com, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	zhenyuw@linux.intel.com, parav@mellanox.com,
	zhihong.wang@intel.com, rodrigo.vivi@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, lingshan.zhu@intel.com
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
Content-Type: multipart/mixed; boundary="===============1741906822813182094=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============1741906822813182094==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 11, 2019 at 04:15:56PM +0800, Jason Wang wrote:
> +struct virtio_mdev_device {
> +	struct virtio_device vdev;
> +	struct mdev_device *mdev;
> +	unsigned long version;
> +
> +	struct virtqueue **vqs;
> +	/* The lock to protect virtqueue list */
> +	spinlock_t lock;
> +	struct list_head virtqueues;

Is this a list of struct virtio_mdev_vq_info?  Please document the
actual type in a comment.

> +static int virtio_mdev_find_vqs(struct virtio_device *vdev, unsigned nvqs,
> +				struct virtqueue *vqs[],
> +				vq_callback_t *callbacks[],
> +				const char * const names[],
> +				const bool *ctx,
> +				struct irq_affinity *desc)
> +{
> +	struct virtio_mdev_device *vm_dev = to_virtio_mdev_device(vdev);
> +	struct mdev_device *mdev = vm_get_mdev(vdev);
> +	const struct virtio_mdev_device_ops *ops = mdev_get_dev_ops(mdev);
> +	struct virtio_mdev_callback cb;
> +	int i, err, queue_idx = 0;
> +
> +	vm_dev->vqs = kmalloc_array(queue_idx, sizeof(*vm_dev->vqs),
> +				    GFP_KERNEL);

kmalloc_array(0, ...)?  I would have expected nvqs instead of queue_idx
(0).

What is this the purpose of vm_dev->vqs and does anything ever access it?

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2kst4ACgkQnKSrs4Gr
c8hQqggAsLqAScuEZRHgMYUxIlc4Hpdh283rOQFgRgPfZqq3hQ/nzKTqbn1k7DnZ
MaXQk/GXc1/mFzEwjGVoMOJ+NiZKpj5xuVN9HqKEuDuBooykO5wKnbwkm6kAs/gG
/10A4I5fkyOUHB+xRkaM/3g9UJgo/yB/oI7yQonKFI3VNQc/Q0vcAWUkUbyoZyZA
WO5IJoOR9nF7g6kkYLT0ik26WZFVsBruKTsifLsCJTCQMWo8dJpvgJpGvo/k07YZ
kWYC8J+K/SRA9gpvDBCfkPRQGMgq7CiE0C+VfoGVo11TuFd6FlkjjYmBIPXYek98
rK1ONn6f4qY+67eRJ77oiNeFsj4eYw==
=7Qm5
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--

--===============1741906822813182094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1741906822813182094==--
