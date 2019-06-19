Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 508B04B61E
	for <lists.virtualization@lfdr.de>; Wed, 19 Jun 2019 12:24:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 04A55EF4;
	Wed, 19 Jun 2019 10:23:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 76E1BEEE
	for <virtualization@lists.linux-foundation.org>;
	Wed, 19 Jun 2019 10:23:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DD06B831
	for <virtualization@lists.linux-foundation.org>;
	Wed, 19 Jun 2019 10:23:56 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s15so1226039wmj.3
	for <virtualization@lists.linux-foundation.org>;
	Wed, 19 Jun 2019 03:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=H33BTDhT/l9EEeZmnjCEB6vo6nawwms9/xSEDH82HBs=;
	b=DuWzSgPpuYB1bAqq2z6L+xcbMuB9j9TW5umh3jBRn3Brn+RvldldinHbpkj96sCgaX
	sRAgC/893y6+MzBGQBLTU77p3X7cVI09Gm2XuT5cjuSpQFazYahxqzlmKo0n42KjlDF5
	ErS3MjgbnggWKlPzTK49GRnCYi1IQ+wlfdHFZXLm1A6zWDQaG+wYRXlQ3K7VLHZuCY2r
	33hoIPjKXD4FDTtXGPYSCzv5srTk8SNyqfLJs5mGo/U0yZUBybm2vxRMpTWDPW17WyHR
	5Vi6k5QzbP+YHb9jE5hxTkwIa6G8VT1AwhglHuAh0oYP4TCZYw4NyitTdpeSWVqOsCcs
	LwdA==
X-Gm-Message-State: APjAAAWs74RHRfwE83r+6uLzjP/DzIqEOjUvpdFQk8K3T/gJbK4CBRZi
	RobiKC77h9aI6UgYyzSfD2kaog==
X-Google-Smtp-Source: APXvYqxWQbLBxZmTwWS5bJ4BnfJppMsFM1KQRXe6s5uE8Qwm3YgP31SQhddztiaw5e1msir7HRMGrQ==
X-Received: by 2002:a1c:a1c5:: with SMTP id k188mr7718728wme.102.1560939835412;
	Wed, 19 Jun 2019 03:23:55 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:51c0:d03f:68e:1f6d?
	([2001:b07:6468:f312:51c0:d03f:68e:1f6d])
	by smtp.gmail.com with ESMTPSA id
	o185sm1198768wmo.45.2019.06.19.03.23.54
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jun 2019 03:23:54 -0700 (PDT)
Subject: Re: [PATCH 1/1] scsi: virtio_scsi: remove unused 'affinity_hint_set'
To: Dongli Zhang <dongli.zhang@oracle.com>,
	virtualization@lists.linux-foundation.org, linux-scsi@vger.kernel.org
References: <1560930739-25692-1-git-send-email-dongli.zhang@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c111c5a3-1602-e935-300d-d75e14fe2bd9@redhat.com>
Date: Wed, 19 Jun 2019 12:24:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1560930739-25692-1-git-send-email-dongli.zhang@oracle.com>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: martin.petersen@oracle.com, mst@redhat.com, linux-kernel@vger.kernel.org,
	stefanha@redhat.com, jejb@linux.ibm.com
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

On 19/06/19 09:52, Dongli Zhang wrote:
> The 'affinity_hint_set' is not used any longer since
> commit 0d9f0a52c8b9 ("virtio_scsi: use virtio IRQ affinity").
> 
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
>  drivers/scsi/virtio_scsi.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
> index 13f1b3b..1705398 100644
> --- a/drivers/scsi/virtio_scsi.c
> +++ b/drivers/scsi/virtio_scsi.c
> @@ -74,9 +74,6 @@ struct virtio_scsi {
>  
>  	u32 num_queues;
>  
> -	/* If the affinity hint is set for virtqueues */
> -	bool affinity_hint_set;
> -
>  	struct hlist_node node;
>  
>  	/* Protected by event_vq lock */
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
