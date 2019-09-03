Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 579F0A6307
	for <lists.virtualization@lfdr.de>; Tue,  3 Sep 2019 09:47:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F0E9ACAB;
	Tue,  3 Sep 2019 07:47:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1FB17C9A
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 07:47:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B8F61709
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 07:47:38 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30DC67BDA1
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 07:47:38 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id m6so2726081wmf.2
	for <virtualization@lists.linux-foundation.org>;
	Tue, 03 Sep 2019 00:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=CnmnWhc2qfmsJ3pZ+ytXKy1jqPtAf/8RAcu/rZxBpOA=;
	b=MBN2kBaSsOztMoyoX9puuaNNfs7EnPkbjuoUCb3Noq7Jed2VU32JtCMDKAAYB65Chh
	btht3fMGzWB9MrPdaTwzFIkIKxYZwsiNsAQpSN2dbxE9PeHzehgTptfTE6tqGPSv6gCw
	fjD4dyVUBJXkDh6zdzFfHa+mknlGEjTg2Urj8ikFu1lsjJQebzbFvFaNgKde6NA2mYVP
	zcM6z0l1FmrmyVPc7Z9ZnQpSaZIWdMjHIVyMbhdUSUVZ32TvpW7KKDcy9OYtqFu5dI7e
	6an65ZQB33MECg53GKRq5TjcykzjUyfMUvz1y6XORhtZbNhHAvMqJK2uFUmWtpmX7hgG
	tdig==
X-Gm-Message-State: APjAAAWFbKZocj4Y+fMtZ2wEEN+0HpZg6X8nYRU9R99x2TpiL2jBmccE
	9CMaLp1E0zUbT6LMUhr0CfXxZIOJyIT7FBpXCYjr1EiMzggxXk6+etuED6IACpBZLSoZuPTAVtu
	PxV++5Hr6w/KmXxcwf5Mqd9QTgXKFU41XxjlLP1ukKA==
X-Received: by 2002:adf:8444:: with SMTP id 62mr40065119wrf.202.1567496856839; 
	Tue, 03 Sep 2019 00:47:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxtF6KOYuQGW6Yd+ADmoPQoTuiB5O/upqyGyY9YWt/HZCmo1caE/75ccLGalCenEsB8+yq/Dg==
X-Received: by 2002:adf:8444:: with SMTP id 62mr40065094wrf.202.1567496856630; 
	Tue, 03 Sep 2019 00:47:36 -0700 (PDT)
Received: from steredhat (host170-61-dynamic.36-79-r.retail.telecomitalia.it.
	[79.36.61.170]) by smtp.gmail.com with ESMTPSA id
	x15sm11040612wmc.16.2019.09.03.00.47.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 00:47:36 -0700 (PDT)
Date: Tue, 3 Sep 2019 09:47:33 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH net-next] vsock/virtio: a better comment on credit update
Message-ID: <20190903074733.dg55ucs7jh5zvfbh@steredhat>
References: <20190903073748.25214-1-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903073748.25214-1-mst@redhat.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
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

On Tue, Sep 03, 2019 at 03:38:16AM -0400, Michael S. Tsirkin wrote:
> The comment we have is just repeating what the code does.
> Include the *reason* for the condition instead.
> 
> Cc: Stefano Garzarella <sgarzare@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  net/vmw_vsock/virtio_transport_common.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> index 94cc0fa3e848..5bb70c692b1e 100644
> --- a/net/vmw_vsock/virtio_transport_common.c
> +++ b/net/vmw_vsock/virtio_transport_common.c
> @@ -307,8 +307,13 @@ virtio_transport_stream_do_dequeue(struct vsock_sock *vsk,
>  
>  	spin_unlock_bh(&vvs->rx_lock);
>  
> -	/* We send a credit update only when the space available seen
> -	 * by the transmitter is less than VIRTIO_VSOCK_MAX_PKT_BUF_SIZE
> +	/* To reduce the number of credit update messages,
> +	 * don't update credits as long as lots of space is available.
> +	 * Note: the limit chosen here is arbitrary. Setting the limit
> +	 * too high causes extra messages. Too low causes transmitter
> +	 * stalls. As stalls are in theory more expensive than extra
> +	 * messages, we set the limit to a high value. TODO: experiment
> +	 * with different values.
>  	 */
>  	if (free_space < VIRTIO_VSOCK_MAX_PKT_BUF_SIZE) {
>  		virtio_transport_send_credit_update(vsk,

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
