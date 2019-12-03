Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E159810F806
	for <lists.virtualization@lfdr.de>; Tue,  3 Dec 2019 07:46:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 19F3786457;
	Tue,  3 Dec 2019 06:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yquzyemwrovy; Tue,  3 Dec 2019 06:46:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A452B86449;
	Tue,  3 Dec 2019 06:46:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82E78C087F;
	Tue,  3 Dec 2019 06:46:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4346FC087F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 06:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3A179875D9
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 06:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BJqRiL9JqzkC
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 06:46:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5B898864D2
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 06:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575355577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vA5yYzMVeAR7MX5nLItDNvtlR0z5cP32F/L2j1iptT8=;
 b=giIx0kNl+O1qn8T2mAb13br44787ADVc9LZ/nfaBPo+I39TGYBDCGAOlbgRugQ5y39yflW
 3luRYXY2lWaEdA+MjiJR3v7GlgFW25g1JnTxIE4m9RY2bEpYimOXBaQD5/rVhD038Cs5DV
 TXeN+X98nE9aZ7Kx0m/wd2MBeoTzSOY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-lrUY0DqwMHq8VOEnaqxEYA-1; Tue, 03 Dec 2019 01:46:14 -0500
Received: by mail-qk1-f198.google.com with SMTP id g28so1559598qkl.6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Dec 2019 22:46:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5lD9ys/e6n0/iiFHbZsselpEih6ljzAg0Ol2fd6ghc8=;
 b=KVGaM1va13jkdFT/xa0yEj4jYKK+PDZdN2NUWR9t5WkixIttCH3lbD/Yg2A+eJRDIE
 Wvr6gR3E4XCbtvzFF6/AZoMXiiHa+0Tv3MLrR4jeI3+2lX5hsNP1astMVDyJejVmT7vt
 eqgqUpPxLe6le1VsoCQzgN8lI0x+AXJnF3dKEyXGQvZgqH9J1zZklnKiN0V/oPqSMjH2
 gItDG7uYP8FeyRUV2hjkjKO/gYAaNEvZw8c2m6HUgushBBAoOHTiQ5lyUVe+1Mljz3x9
 UqlJfN6zpeMGGQU8eG6xEWu+qTpv4KvdEwLbiE+0QemQPtGWM2UJ6OdSCKOqYvjbmCpW
 lPVQ==
X-Gm-Message-State: APjAAAV5qkIWBI2ShGsmNJjNpMvPqIClMRP4IyFQ6BIAJMKXdF1lyBx6
 Hm6BMo9KJlv2orQBPBGdlUCWJIcqzLAUnD7xM4jIOqQPu8JKL5gGTA022V8+Ms45Tg+LmD4AQCe
 xq+lslaPv98yQvUcTPaAhdIC6Vjn0gBzK4/ZWDkRmVw==
X-Received: by 2002:a05:6214:6f2:: with SMTP id
 bk18mr3637685qvb.10.1575355573809; 
 Mon, 02 Dec 2019 22:46:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqzHP1tQP7g2Sng6YU0HR1cRLUHJw7uxyUQLE+cn94MbMnvnCBHBi0CW36CkABjS5928Kye+qQ==
X-Received: by 2002:a05:6214:6f2:: with SMTP id
 bk18mr3637672qvb.10.1575355573480; 
 Mon, 02 Dec 2019 22:46:13 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id v143sm1222002qka.3.2019.12.02.22.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 22:46:12 -0800 (PST)
Date: Tue, 3 Dec 2019 01:46:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Martin Habets <mhabets@solarflare.com>
Subject: Re: [net-next V3 1/2] netdev: pass the stuck queue to the timeout
 handler
Message-ID: <20191203014532-mutt-send-email-mst@kernel.org>
References: <20191126200628.22251-1-jcfaracco@gmail.com>
 <20191126200628.22251-2-jcfaracco@gmail.com>
 <c2cddeea-8a6e-f0b9-1fde-7d2a29538518@solarflare.com>
MIME-Version: 1.0
In-Reply-To: <c2cddeea-8a6e-f0b9-1fde-7d2a29538518@solarflare.com>
X-MC-Unique: lrUY0DqwMHq8VOEnaqxEYA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: dnmendes76@gmail.com, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Julio Faracco <jcfaracco@gmail.com>,
 davem@davemloft.net
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Wed, Nov 27, 2019 at 03:11:51PM +0000, Martin Habets wrote:
> Your @work correctly identifies that the drivers/net/ethernet/sfc drivers need patching, but the actual patches for them are missing.
> Please add those. Makes me wonder if any other files are missing patches.
> 
> Martin

Good point, pattern was missing _ in variable name. Will repost a
fixed version.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
