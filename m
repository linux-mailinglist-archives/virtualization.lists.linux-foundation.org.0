Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 639B1284D0
	for <lists.virtualization@lfdr.de>; Thu, 23 May 2019 19:22:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D6240F00;
	Thu, 23 May 2019 17:22:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D79CAE53
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 17:22:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7C7BF87D
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 17:22:38 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id c15so4304571qkl.2
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 10:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=orxdKAeTGhuAr1KDO8ykLR98bbgYAJIpSNP1r+lkby0=;
	b=qsNf3h/OuG45+yuiksa35FjQUgsf+VYkVeHDQwqh/EgxFXgqmm2zR5TDpwNw95U1tm
	2jl5+A2XuxYw78MWj2vsojWpA+jTDacu2mKb2YrKieMnnY7eRVUzTkeX9lslhZtPMWPx
	2BE23S/Gp2eTIkWmJC/o1sdVhijHTTAITaeYiSvjfiP+T8in6uyOEGNLjoIirXIwd/mE
	iOh7/R04OJfkZS8nqZQAw4BHeB71Hq80VB/P64zsB930q3HI89qlyhda2Zi2/yFxmz4L
	knDx0AGhoHe9HuAvVtbprFpUX/m+A5A92MCxKvgV3nRXp3jgEHC5Fnuqd6LF681M5Ciy
	H1LQ==
X-Gm-Message-State: APjAAAUzM8r1R77J02+ceTp3bN3hiR6UklF+ZRTS2P+bQQcVOLGW9u/w
	wzqVdlt3md5TYKrf5bH6lQqxsQ==
X-Google-Smtp-Source: APXvYqykamv1Wqqs833PdyLZedOafUeo+CHIJkq0yhHSr/u9oMeUTX6fQlKnQFFG/JvpWeUzz3qZdw==
X-Received: by 2002:a05:620a:1084:: with SMTP id
	g4mr75399078qkk.228.1558632157708; 
	Thu, 23 May 2019 10:22:37 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71]) by smtp.gmail.com with ESMTPSA id
	x30sm18102171qtx.35.2019.05.23.10.22.34
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 23 May 2019 10:22:36 -0700 (PDT)
Date: Thu, 23 May 2019 13:22:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Miller <davem@davemloft.net>
Subject: Re: [PATCH V2 0/4] Prevent vhost kthread from hogging CPU
Message-ID: <20190523132228-mutt-send-email-mst@kernel.org>
References: <1558067392-11740-1-git-send-email-jasowang@redhat.com>
	<20190518.132712.1971625204431294331.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190518.132712.1971625204431294331.davem@davemloft.net>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, stefanha@redhat.com,
	pbonzini@redhat.com
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

On Sat, May 18, 2019 at 01:27:12PM -0700, David Miller wrote:
> From: Jason Wang <jasowang@redhat.com>
> Date: Fri, 17 May 2019 00:29:48 -0400
> 
> > Hi:
> > 
> > This series try to prevent a guest triggerable CPU hogging through
> > vhost kthread. This is done by introducing and checking the weight
> > after each requrest. The patch has been tested with reproducer of
> > vsock and virtio-net. Only compile test is done for vhost-scsi.
> > 
> > Please review.
> > 
> > This addresses CVE-2019-3900.
> > 
> > Changs from V1:
> > - fix user-ater-free in vosck patch
> 
> I am assuming that not only will mst review this, it will also go via
> his tree rather than mine.
> 
> Thanks.

Will do.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
