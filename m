Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCC772983
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 10:08:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0DA19DBC;
	Wed, 24 Jul 2019 08:08:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 42858AF7
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 08:08:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1A258894
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 08:08:08 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id d15so33100384qkl.4
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 01:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=/MFYQFzENwHk5G46kOvOVKTzaxjp4jXpKM7WypPWBDc=;
	b=FS6b83HrpcE8QOpRaxw2SCzGjLKd7u0bRmGOQNWSxiGtdvAsCbm3ObG5vC98nl31EK
	L+OzJQUJ0VsE8De7rXnUqgX8uC2xfm6EGtxt+T3v6Z94lPvUyppiShl82t0lczOw6c7b
	QmP6B1WgiASO+Hrx/JkKr/JaAAJKGGLMAS+fPMoFnQ9/em3uWKhvwaeuFlfxMFH4BgXL
	Ye1/KeDBAIxS5sUFq3lyCfaGt3Zlzqbo4PMNqYEoOmk3bcY1UD0XEJpRPijDn+DjSeIa
	DnaodtbqC0Z1qhh3COzE8LG4ypCgcceE7kVg5W1Py0RmPNRJIpP85OE8z/HDxPhkY53Z
	N2Xg==
X-Gm-Message-State: APjAAAVBnPbO5aaXkPPKvVo7SLFpNx1DCcY9Jbpf/3UzWh5v0MMBZGpF
	jb8IRZPmU1c+F9SgSSL8T5DEIQ==
X-Google-Smtp-Source: APXvYqyqOJ7xj5WyBSGnSKw6r+fHzKSSQgggyWILPC/N5KbhyvrIGi3wpGDnO2q6i0xNWsrtSCd37A==
X-Received: by 2002:a05:620a:31b:: with SMTP id
	s27mr17648521qkm.264.1563955687250; 
	Wed, 24 Jul 2019 01:08:07 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	t26sm23203051qtc.95.2019.07.24.01.07.58
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 24 Jul 2019 01:08:06 -0700 (PDT)
Date: Wed, 24 Jul 2019 04:07:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: john.hubbard@gmail.com
Subject: Re: [PATCH 07/12] vhost-scsi: convert put_page() to put_user_page*()
Message-ID: <20190724040745-mutt-send-email-mst@kernel.org>
References: <20190724042518.14363-1-jhubbard@nvidia.com>
	<20190724042518.14363-8-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724042518.14363-8-jhubbard@nvidia.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Boaz Harrosh <boaz@plexistor.com>, Jan Kara <jack@suse.cz>,
	kvm@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Christoph Hellwig <hch@lst.de>, linux-cifs@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>, linux-rdma@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Johannes Thumshirn <jthumshirn@suse.de>,
	v9fs-developer@lists.sourceforge.net,
	Eric Van Hensbergen <ericvh@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Stefan Hajnoczi <stefanha@redhat.com>, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org, samba-technical@lists.samba.org,
	LKML <linux-kernel@vger.kernel.org>,
	"David S . Miller" <davem@davemloft.net>, linux-fsdevel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Tue, Jul 23, 2019 at 09:25:13PM -0700, john.hubbard@gmail.com wrote:
> From: J=E9r=F4me Glisse <jglisse@redhat.com>
> =

> For pages that were retained via get_user_pages*(), release those pages
> via the new put_user_page*() routines, instead of via put_page().
> =

> This is part a tree-wide conversion, as described in commit fc1d8e7cca2d
> ("mm: introduce put_user_page*(), placeholder versions").
> =

> Changes from J=E9r=F4me's original patch:
> =

> * Changed a WARN_ON to a BUG_ON.
> =

> Signed-off-by: J=E9r=F4me Glisse <jglisse@redhat.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Cc: virtualization@lists.linux-foundation.org
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-block@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: Jan Kara <jack@suse.cz>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Johannes Thumshirn <jthumshirn@suse.de>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Ming Lei <ming.lei@redhat.com>
> Cc: Dave Chinner <david@fromorbit.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Boaz Harrosh <boaz@plexistor.com>
> Cc: Miklos Szeredi <miklos@szeredi.hu>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  drivers/vhost/scsi.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
> index a9caf1bc3c3e..282565ab5e3f 100644
> --- a/drivers/vhost/scsi.c
> +++ b/drivers/vhost/scsi.c
> @@ -329,11 +329,11 @@ static void vhost_scsi_release_cmd(struct se_cmd *s=
e_cmd)
>  =

>  	if (tv_cmd->tvc_sgl_count) {
>  		for (i =3D 0; i < tv_cmd->tvc_sgl_count; i++)
> -			put_page(sg_page(&tv_cmd->tvc_sgl[i]));
> +			put_user_page(sg_page(&tv_cmd->tvc_sgl[i]));
>  	}
>  	if (tv_cmd->tvc_prot_sgl_count) {
>  		for (i =3D 0; i < tv_cmd->tvc_prot_sgl_count; i++)
> -			put_page(sg_page(&tv_cmd->tvc_prot_sgl[i]));
> +			put_user_page(sg_page(&tv_cmd->tvc_prot_sgl[i]));
>  	}
>  =

>  	vhost_scsi_put_inflight(tv_cmd->inflight);
> @@ -630,6 +630,13 @@ vhost_scsi_map_to_sgl(struct vhost_scsi_cmd *cmd,
>  	size_t offset;
>  	unsigned int npages =3D 0;
>  =

> +	/*
> +	 * Here in all cases we should have an IOVEC which use GUP. If that is
> +	 * not the case then we will wrongly call put_user_page() and the page
> +	 * refcount will go wrong (this is in vhost_scsi_release_cmd())
> +	 */
> +	WARN_ON(!iov_iter_get_pages_use_gup(iter));
> +
>  	bytes =3D iov_iter_get_pages(iter, pages, LONG_MAX,
>  				VHOST_SCSI_PREALLOC_UPAGES, &offset);
>  	/* No pages were pinned */
> @@ -681,7 +688,7 @@ vhost_scsi_iov_to_sgl(struct vhost_scsi_cmd *cmd, boo=
l write,
>  			while (p < sg) {
>  				struct page *page =3D sg_page(p++);
>  				if (page)
> -					put_page(page);
> +					put_user_page(page);
>  			}
>  			return ret;
>  		}
> -- =

> 2.22.0
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
