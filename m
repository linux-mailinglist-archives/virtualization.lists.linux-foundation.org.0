Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9A6D42D3
	for <lists.virtualization@lfdr.de>; Fri, 11 Oct 2019 16:28:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4B9D41A5A;
	Fri, 11 Oct 2019 14:28:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6FFD614B0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 14:19:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F0D5789D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 14:19:20 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E7AE3D966
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 14:19:20 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id o34so9522174qtf.22
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 07:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=tOHWk3jmfyzzhm92cDghOddICmz8kRnulovjwgtaBGg=;
	b=im6fcHrqcHrcZPl5jzZa/ytU466Qy1nu38ZjwLbXaAv4R0LD4gLpeLWu/ETSngKyQQ
	uipNHdLlwD40Pijs6ldLOwSNbxdN6NDrYga6O/hNmJycLGh8lDHFU6898CEwB1KpHads
	3D+4hY+jh+S39RdkPlXS5OBYthcwuCPd/t1ODT04qh+893HXHnQfdFiK4/LoJbFfjI6x
	f5bI2/piItifyxRsM71KcOLUEdgaOFPB+I5EcElq21DVVudBrB6w9uDegz+l1gTzdcCy
	m+i7UEGmcD3QbmQZVsxmesxCXXO+CiGa98IEyeqq38ts5i7YZi6TMmTHApYPC0u8vMcE
	ugJw==
X-Gm-Message-State: APjAAAUxBZoBlLBFkFo2BmT2wFAbqsGNW80Pp9onxFP4efMohGNUgOP4
	+4nhAky23B2oNTuf3OANpaqt1TC0AlRMDgg0ZtSGlpEHcFF1cDhzNo9v1EIHL2SuGEKXG6Imzph
	590jz2Z4+jSmcnGGZ7ihg1IVjYVjoU5affnbsnKeCKA==
X-Received: by 2002:a37:5d3:: with SMTP id 202mr15754099qkf.155.1570803559737; 
	Fri, 11 Oct 2019 07:19:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy+WP4PnUirSsaoubHKJFArFKDsMl3YSsGut8UXfiBxoMA6BIkgeYPrju7GgkVsxDH1VHgtqQ==
X-Received: by 2002:a37:5d3:: with SMTP id 202mr15754075qkf.155.1570803559502; 
	Fri, 11 Oct 2019 07:19:19 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	s16sm3621356qkg.40.2019.10.11.07.19.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 07:19:18 -0700 (PDT)
Date: Fri, 11 Oct 2019 10:19:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net 0/2] vsock: don't allow half-closed socket in the
	host transports
Message-ID: <20191011101408-mutt-send-email-mst@kernel.org>
References: <20191011130758.22134-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011130758.22134-1-sgarzare@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Adit Ranadive <aditr@vmware.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	virtualization@lists.linux-foundation.org,
	"David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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

On Fri, Oct 11, 2019 at 03:07:56PM +0200, Stefano Garzarella wrote:
> We are implementing a test suite for the VSOCK sockets and we discovered
> that vmci_transport never allowed half-closed socket on the host side.
> 
> As Jorgen explained [1] this is due to the implementation of VMCI.
> 
> Since we want to have the same behaviour across all transports, this
> series adds a section in the "Implementation notes" to exaplain this
> behaviour, and changes the vhost_transport to behave the same way.
> 
> [1] https://patchwork.ozlabs.org/cover/847998/#1831400

Half closed sockets are very useful, and lots of
applications use tricks to swap a vsock for a tcp socket,
which might as a result break.

If VMCI really cares it can implement an ioctl to
allow applications to detect that half closed sockets aren't supported.

It does not look like VMCI wants to bother (users do not read
kernel implementation notes) so it does not really care.
So why do we want to cripple other transports intentionally?



> Stefano Garzarella (2):
>   vsock: add half-closed socket details in the implementation notes
>   vhost/vsock: don't allow half-closed socket in the host
> 
>  drivers/vhost/vsock.c    | 17 ++++++++++++++++-
>  net/vmw_vsock/af_vsock.c |  4 ++++
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> -- 
> 2.21.0
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
