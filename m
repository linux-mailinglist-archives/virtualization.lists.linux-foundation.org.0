Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D4EA38BF
	for <lists.virtualization@lfdr.de>; Fri, 30 Aug 2019 16:04:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 222E3618E;
	Fri, 30 Aug 2019 14:04:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CFEF35BE7
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 14:02:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EFC6013A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 14:02:40 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
	[209.85.222.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 430C0C057E16
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 14:02:40 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id o4so7420901qkg.11
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 07:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=dm3SQV6KNXW2r52/sYgn7Fx2GIZBh2qt4DQKQJwM1eI=;
	b=L9vgCgIOwMDVCUL4hj07HyQHoP8ECiyka+Yursv/SuDo4qa5LarrRA3fQF5lx0jgH7
	+KQjtGhATpfV0KqwGyyjFkjbmV81culQ75jXUk04vvi4Hc9J0D39Gz/x5iDEZszTefYl
	iCTqbJY/gSoCuPJpYFDv3RbKcJnQWKnswXVPfa1EWRaq9la1KCtAv1u41/jU+qTsP54X
	mLcc8FIKwCcxFulbOrMkqNml9L6qI9n06hlQ2iF2TMCsZPf16kczhk/wlM3sH6YrTeaZ
	DIGOaHiK7gIAT77BbNLVUjWlQX1nbQCCwxnB1fa+cPMxMEawXWMiiqWcPesOVnXIuoMF
	oLVg==
X-Gm-Message-State: APjAAAX6UsCxOyNVxv7kqz1TxI046JZxPuF8btLhk3LGS+tGansPS/Qj
	UiYVBGo1i2BSM/GRulHL5izDKzhcB7+ZW/nbedkCdPeow6Uu/Sj4vBR9sIBdL4OqkiiCJvizxI7
	TpexfDvobkBm2RRj6IgHk1qGesqJiowBHIU6kY9Aq7Q==
X-Received: by 2002:ae9:e207:: with SMTP id c7mr14781981qkc.262.1567173759587; 
	Fri, 30 Aug 2019 07:02:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyzpK/f9AAF+jxF06AYZCj6OSOKjlMicezFhcQw9CYKtXu7XbuSnQ4ytRP0nU0sisqBK38Nqw==
X-Received: by 2002:ae9:e207:: with SMTP id c7mr14781962qkc.262.1567173759358; 
	Fri, 30 Aug 2019 07:02:39 -0700 (PDT)
Received: from redhat.com (bzq-79-180-62-110.red.bezeqint.net. [79.180.62.110])
	by smtp.gmail.com with ESMTPSA id
	v13sm2651158qkj.109.2019.08.30.07.02.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 07:02:37 -0700 (PDT)
Date: Fri, 30 Aug 2019 10:02:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matej Genci <matej.genci@nutanix.com>
Subject: Re: [PATCH] virtio: Change typecasts in vring_init()
Message-ID: <20190830095928-mutt-send-email-mst@kernel.org>
References: <20190827152000.53920-1-matej.genci@nutanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827152000.53920-1-matej.genci@nutanix.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
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

On Tue, Aug 27, 2019 at 03:20:57PM +0000, Matej Genci wrote:
> Compilers such as g++ 7.3 complain about assigning void* variable to
> a non-void* variable (like struct pointers) and pointer arithmetics
> on void*.
> 
> Signed-off-by: Matej Genci <matej.genci@nutanix.com>
> ---
>  include/uapi/linux/virtio_ring.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/include/uapi/linux/virtio_ring.h b/include/uapi/linux/virtio_ring.h
> index 4c4e24c291a5..2c339b9e2923 100644
> --- a/include/uapi/linux/virtio_ring.h
> +++ b/include/uapi/linux/virtio_ring.h
> @@ -168,10 +168,11 @@ static inline void vring_init(struct vring *vr, unsigned int num, void *p,
>  			      unsigned long align)
>  {
>  	vr->num = num;
> -	vr->desc = p;
> -	vr->avail = p + num*sizeof(struct vring_desc);
> -	vr->used = (void *)(((uintptr_t)&vr->avail->ring[num] + sizeof(__virtio16)
> -		+ align-1) & ~(align - 1));
> +	vr->desc = (struct vring_desc *)p;
> +	vr->avail = (struct vring_avail *)((uintptr_t)p
> +		+ num*sizeof(struct vring_desc));
> +	vr->used = (struct vring_used *)(((uintptr_t)&vr->avail->ring[num]
> +		+ sizeof(__virtio16) + align-1) & ~(align - 1));
>  }
>  
>  static inline unsigned vring_size(unsigned int num, unsigned long align)

I'm not really interested in building with g++, sorry.
Centainly not if it makes code less robust by forcing
casts where they weren't previously necessary.

However, vring_init and vring_size are legacy APIs anyway,
so I'd be happy to add ifndefs that will allow userspace
simply hide these functions if it does not need them.


> -- 
> 2.22.0
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
