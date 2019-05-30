Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C9630197
	for <lists.virtualization@lfdr.de>; Thu, 30 May 2019 20:13:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 769CC2500;
	Thu, 30 May 2019 18:13:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 171E524F3
	for <virtualization@lists.linux-foundation.org>;
	Thu, 30 May 2019 18:13:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B168C87D
	for <virtualization@lists.linux-foundation.org>;
	Thu, 30 May 2019 18:13:32 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id i34so8139330qta.6
	for <virtualization@lists.linux-foundation.org>;
	Thu, 30 May 2019 11:13:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=swUKp54FsABaRx/HQxckmg32aK739BKT6ewItuokNDk=;
	b=SlO+VT8WYPIMbEVpATDozqpSI/2IBYhvRxMXmG0Ll3aLb+GQYOsWaeSAUZ5yeJ9zoc
	oX6rSISqgJpCJ5ocHiZe/ZpWICy6EO7WaAcwRfLw6Xl+BiFgXjlIXNmTuUSafehK5PCC
	rbqHsfy3ENyZ4hDP4E7/wBCNblx/16IVFc41I5WjPf03EwgNPBRzHFoHnXn+Hc0G7u+k
	Ex+WgteueQahNUKdkXygaR0laoYyEx7qIQ1vmjLY/hE7QvNtRY4FbeweTxZuZldXTpkY
	DVI4GzN7hSie1OeuKE/3Ww6cwJNCXFfNHdrnCQdZj84VggBKqhh0/F8E0W5Zpv6B0tRk
	SvuQ==
X-Gm-Message-State: APjAAAVQhVC0nQnTLbN5SKArOyel9xBlP7mochC2V3xy8cHmsWuf8+sV
	LIZmTpTdVu2Qri9Wvh0PwW6OHQ==
X-Google-Smtp-Source: APXvYqyndgU/JBNxGTz081BydLXYPXGN+1/yzyTBopwAP5jF6DEPVUhyIlMc188XrJEeCGJfnA2k0g==
X-Received: by 2002:aed:2494:: with SMTP id t20mr4813376qtc.135.1559240011968; 
	Thu, 30 May 2019 11:13:31 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103])
	by smtp.gmail.com with ESMTPSA id k9sm1894099qki.20.2019.05.30.11.13.30
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 30 May 2019 11:13:31 -0700 (PDT)
Date: Thu, 30 May 2019 14:13:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 0/6] vhost: accelerate metadata access
Message-ID: <20190530141243-mutt-send-email-mst@kernel.org>
References: <20190524081218.2502-1-jasowang@redhat.com>
	<20190530.110730.2064393163616673523.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190530.110730.2064393163616673523.davem@davemloft.net>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: hch@infradead.org, linux-parisc@vger.kernel.org, kvm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	James.Bottomley@hansenpartnership.com, linux-mm@kvack.org,
	jglisse@redhat.com, jrdr.linux@gmail.com,
	linux-arm-kernel@lists.infradead.org, christophe.de.dinechin@gmail.com
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

On Thu, May 30, 2019 at 11:07:30AM -0700, David Miller wrote:
> From: Jason Wang <jasowang@redhat.com>
> Date: Fri, 24 May 2019 04:12:12 -0400
> 
> > This series tries to access virtqueue metadata through kernel virtual
> > address instead of copy_user() friends since they had too much
> > overheads like checks, spec barriers or even hardware feature
> > toggling like SMAP. This is done through setup kernel address through
> > direct mapping and co-opreate VM management with MMU notifiers.
> > 
> > Test shows about 23% improvement on TX PPS. TCP_STREAM doesn't see
> > obvious improvement.
> 
> I'm still waiting for some review from mst.
> 
> If I don't see any review soon I will just wipe these changes from
> patchwork as it serves no purpose to just let them rot there.
> 
> Thank you.

I thought we agreed I'm merging this through my tree, not net-next.
So you can safely wipe it.

Thanks!

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
