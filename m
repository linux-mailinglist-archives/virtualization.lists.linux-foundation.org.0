Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EDED0AF8EC
	for <lists.virtualization@lfdr.de>; Wed, 11 Sep 2019 11:30:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4E1E91A9C;
	Wed, 11 Sep 2019 09:29:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3E43D1A93
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 09:29:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2FA3583A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 09:29:57 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 99D6D796EB
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 09:29:56 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id o13so17495917qtr.15
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 02:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=Zt5S4a6X6LyLwhE9vIVWQMU/7PuQubto3A7P5mD1PK4=;
	b=KQuAdJPRkmqplANbNV+fFsacpd9a5R7RYRveTKAP9Q/zGlQjw1WkfMHCHSvCt2wPsV
	49wPm2YgnqcL1754vMplH3onQbfc2pI3lExD9TKK8/+dJiQy10TsLFeTZilYJT/XQ1P7
	/UakhbxiCkbdeVVBeqnf3tB2Ozmv6e1NYpYZiYZ5qgEU8gyYkhKt8z/n62nGij+4SqdP
	+Z3KX572fChvwYNVKWQaZ9j8noItx+60AouOBKbEMwgRJUVKwn6xaN/9BS0rKjAwf+5M
	uMemJER4Tov/jVramAGQTMC3CKrGO3KLma7NDRgK1/ib/Wad7NNFAFHaXawk0pzaguit
	YmYQ==
X-Gm-Message-State: APjAAAXbAIQgVC8fXX1ktUrIwWxXO3BOPvCeQcuPxq8fbwkK7KhWLt5N
	kIJiy0dNfezpYWJksX9yZSjNKHFERafFa7bxwQa8vhlsnV25I2d9pkzkcpjwpc63sYrRYNJuhlM
	jsuVf16YX4dtQDDZmLUaxRw561NweiOr0im5DF4G+6w==
X-Received: by 2002:a37:48cd:: with SMTP id
	v196mr33105330qka.419.1568194195927; 
	Wed, 11 Sep 2019 02:29:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyE8k+b7UWHLIlJ8Xibf2YSLj1PYH2HcRg+svLgOynqAQVbEpwFlt5nBwF+4ii6zLUj2pOgDg==
X-Received: by 2002:a37:48cd:: with SMTP id
	v196mr33105319qka.419.1568194195786; 
	Wed, 11 Sep 2019 02:29:55 -0700 (PDT)
Received: from redhat.com ([80.74.107.118])
	by smtp.gmail.com with ESMTPSA id h68sm9749151qkf.2.2019.09.11.02.29.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 02:29:55 -0700 (PDT)
Date: Wed, 11 Sep 2019 05:29:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matej Genci <matej.genci@nutanix.com>
Subject: Re: [PATCH v2] virtio: add VIRTIO_RING_NO_LEGACY
Message-ID: <20190911052825-mutt-send-email-mst@kernel.org>
References: <20190910175335.231660-1-matej.genci@nutanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190910175335.231660-1-matej.genci@nutanix.com>
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	RCVD_IN_SORBS_WEB autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Tue, Sep 10, 2019 at 05:53:44PM +0000, Matej Genci wrote:
> Add macro to disable legacy functions vring_init and vring_size.
> 
> Signed-off-by: Matej Genci <matej.genci@nutanix.com>
> ---
> 
> V2: Put all legacy APIs inside guards.
> 
> ---
>  include/uapi/linux/virtio_ring.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/uapi/linux/virtio_ring.h b/include/uapi/linux/virtio_ring.h
> index 4c4e24c291a5..efe5a421b4ea 100644
> --- a/include/uapi/linux/virtio_ring.h
> +++ b/include/uapi/linux/virtio_ring.h
> @@ -118,6 +118,8 @@ struct vring_used {
>  	struct vring_used_elem ring[];
>  };
>  
> +#ifndef VIRTIO_RING_NO_LEGACY
> +
>  struct vring {
>  	unsigned int num;
>  
> @@ -128,6 +130,8 @@ struct vring {
>  	struct vring_used *used;
>  };
>  
> +#endif /* VIRTIO_RING_NO_LEGACY */
> +
>  /* Alignment requirements for vring elements.
>   * When using pre-virtio 1.0 layout, these fall out naturally.
>   */
> @@ -135,6 +139,8 @@ struct vring {
>  #define VRING_USED_ALIGN_SIZE 4
>  #define VRING_DESC_ALIGN_SIZE 16
>  
> +#ifndef VIRTIO_RING_NO_LEGACY
> +
>  /* The standard layout for the ring is a continuous chunk of memory which looks
>   * like this.  We assume num is a power of 2.
>   *
> @@ -195,6 +201,8 @@ static inline int vring_need_event(__u16 event_idx, __u16 new_idx, __u16 old)
>  	return (__u16)(new_idx - event_idx - 1) < (__u16)(new_idx - old);
>  }
>  
> +#endif /* VIRTIO_RING_NO_LEGACY */
> +
>  struct vring_packed_desc_event {
>  	/* Descriptor Ring Change Event Offset/Wrap Counter. */
>  	__le16 off_wrap;

OK almost but vring_need_event is actually useful for all variants
so should be outside the guards :) Sorry about it.

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
