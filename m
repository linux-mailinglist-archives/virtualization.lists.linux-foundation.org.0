Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E07273725
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:01:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5921F14A2;
	Wed, 24 Jul 2019 18:59:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 46091D2A
	for <virtualization@lists.linux-foundation.org>;
	Thu,  6 Jun 2019 20:06:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C0A3534F
	for <virtualization@lists.linux-foundation.org>;
	Thu,  6 Jun 2019 20:06:27 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id c26so5102331edt.1
	for <virtualization@lists.linux-foundation.org>;
	Thu, 06 Jun 2019 13:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=fKoBABNUkCBeoWcN3BB4mAKSq62cz70yQSacxGxsGFc=;
	b=NDCKEI/RYiZCejraQ4pA3/blft0AGjyUEblNUUYKerTg8wmYi8n93ZXUNAUpJCKF3z
	20X0CM2nsNucYryIixtGheZZNLlIk7HbS+1JTXdITy8utZREwu9KjGSE63vkSpB7890K
	VDQAkCjGnSDYE3bS74Q+dbwBlWsQqX+dNOWBiUt5pMEvXRV63aufujwZsed+3BJq3vbb
	ZlfAqHz3TlzljUxZACUgRZARSB2qug1H3SO4ou+4sa9S4bkgyupCoeAE3bN/pbRq+1zG
	eiZHVv6/Kdsev1X8QP2yTRePtDdx1rmuqvTvM/xfBTp0Vb+gQrusWhynOXMOrd7N1FkP
	1zWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fKoBABNUkCBeoWcN3BB4mAKSq62cz70yQSacxGxsGFc=;
	b=pIKjnAsbdPHyNgnVqebvQcSGh9auf0lX6ay92Ka5jwF1mdTTKBEf524xjZWYiTYBeV
	QkKHHTx5Ukh973G4MWgpyMZLSHlqML+mJ0FiARKdWOJxQN9yeTRBPdC9ZGd9FtARrzsV
	D0+ZYL6dvxA6KkOXhvf+y5NjTd+93cJgcHfoKk3K8M9/qEfZXfVoI12u2+d5MAAfbmwW
	TSW7ZPZaX5qOyQlRiQWPUrPBYuY+GLYR8knFOZs4xgmIOwI3ioqNhalYegYtyP4Q+nsR
	S2dRsZ7wlr2EtQZMeSQFt5UdQ85sOUipoPuXfvrVT3JfA7L7SOAKt3NrGLtvd8qwZNrK
	QwKg==
X-Gm-Message-State: APjAAAUOQo6K4E8tBViX1udoHAHXIZS8rvPNDawhXTo9Z8RK1JA1AQ0A
	WasU/mWobmboaKSnN368tEs=
X-Google-Smtp-Source: APXvYqx7REg+H//KW6T/w1Ar/5mEf3ZqsGGG5JRSRXtG5RKWIoZSD9VJF2oR+CPvdQkvfQak4CXcVw==
X-Received: by 2002:a17:906:3551:: with SMTP id
	s17mr42857015eja.19.1559851586295; 
	Thu, 06 Jun 2019 13:06:26 -0700 (PDT)
Received: from archlinux-epyc ([2a01:4f9:2b:2b15::2])
	by smtp.gmail.com with ESMTPSA id c21sm1735ejk.79.2019.06.06.13.06.24
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 06 Jun 2019 13:06:25 -0700 (PDT)
Date: Thu, 6 Jun 2019 13:06:23 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost: Don't use defined in VHOST_ARCH_CAN_ACCEL_UACCESS
	definition
Message-ID: <20190606200623.GA12580@archlinux-epyc>
References: <20190606161223.67979-1-natechancellor@gmail.com>
	<20190606142606-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606142606-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 24 Jul 2019 18:59:23 +0000
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	clang-built-linux@googlegroups.com
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

On Thu, Jun 06, 2019 at 02:28:55PM -0400, Michael S. Tsirkin wrote:
> I'd prefer just changing the definition.
> ifdefs have a disadvantage that it's easy to get
> wrong code if you forget to include a header.
> 
> I queued the below - pls confirm it works for you.

Fine by me, I figured that might be preferred (since clang will warn if
VHOST_ARCH_CAN_ACCEL_UACCESS is not defined so you'd know if the header
was forgotten). Thank you for the fix :)

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>

> 
> 
> diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
> index c5d950cf7627..819296332913 100644
> --- a/drivers/vhost/vhost.h
> +++ b/drivers/vhost/vhost.h
> @@ -95,8 +95,11 @@ struct vhost_uaddr {
>  	bool write;
>  };
>  
> -#define VHOST_ARCH_CAN_ACCEL_UACCESS defined(CONFIG_MMU_NOTIFIER) && \
> -	ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE == 0
> +#if defined(CONFIG_MMU_NOTIFIER) && ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE == 0
> +#define VHOST_ARCH_CAN_ACCEL_UACCESS 1
> +#else
> +#define VHOST_ARCH_CAN_ACCEL_UACCESS 0
> +#endif
>  
>  /* The virtqueue structure describes a queue attached to a device. */
>  struct vhost_virtqueue {
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
