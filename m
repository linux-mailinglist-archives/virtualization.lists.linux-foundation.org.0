Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A53AF8F3
	for <lists.virtualization@lfdr.de>; Wed, 11 Sep 2019 11:31:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A7F561AA0;
	Wed, 11 Sep 2019 09:31:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E92051AA0
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 09:31:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 77C1F83A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 09:31:32 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0A5EB69EE6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 09:31:32 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id x13so14471078qtq.13
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 02:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=ut3tihE7bTGmYZVRoILxbz8fluSN7bHwSi8fhoDIScQ=;
	b=cMC+RLBdaelufEQjWXf5ggFkuFW/G+HJK4Exx1fFkF22eloWjC4CQcHTS9ilFCVUo4
	vI6T180qvVZEFN9Y4sBDNWPsQXJ0h9NffOhgGFehoVUMD7CaJGZ10a47pHQNpTjXikne
	psPMp4yVPYTtLi2ZDGEA4pz6uC31MJ9hUaiiBmUkIL/CFJYjr1N9Ty7BrkJx3qyc0r6Q
	wEZ1wnM0l6iF1FAzxK9oxVAd8F5LsZHWY1ZfQ7DOoSWoLwoNcucgL1ns+LthvnAsfK/J
	zMGuAJU7R5H00R5jVKXnMN0BUK4GGs4SvaRt47m0k1nIbnMn8cLYAup0W4V0yiSdnscj
	llVw==
X-Gm-Message-State: APjAAAVX0MpS66/Npt2LTYphqSce6JvaiST5HEiCHVnt2lwbPI0JDlBD
	/ltrD0IpxpwPbRD4tW+xlCrj5KWoja2Fsq5P7XpgFXU1SUUilUamacSNM9akHXyLvkSyyVj+Vht
	8mXNtqDO0W6asUGFVK94TiSg/QhE9+U/D/2FtnI1nnQ==
X-Received: by 2002:ae9:f20f:: with SMTP id m15mr16057178qkg.199.1568194291043;
	Wed, 11 Sep 2019 02:31:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzfzPT6SmbrsRtarE+GakuNnjpB2pyzd8QrqvF/zQOj7HHkg+hOJA0Po72fFkFP2UoCQrr4Cg==
X-Received: by 2002:ae9:f20f:: with SMTP id m15mr16057160qkg.199.1568194290901;
	Wed, 11 Sep 2019 02:31:30 -0700 (PDT)
Received: from redhat.com ([80.74.107.118]) by smtp.gmail.com with ESMTPSA id
	c29sm13406696qtc.89.2019.09.11.02.31.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 02:31:30 -0700 (PDT)
Date: Wed, 11 Sep 2019 05:31:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matej Genci <matej.genci@nutanix.com>
Subject: Re: [PATCH v2] virtio: add VIRTIO_RING_NO_LEGACY
Message-ID: <20190911053030-mutt-send-email-mst@kernel.org>
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

And I guess we should be able to define this macro in
drivers/virtio/virtio_pci_modern.c
?

Will be handy to make sure we don't mask too much.

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
> -- 
> 2.22.0
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
