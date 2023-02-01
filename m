Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB42686AE6
	for <lists.virtualization@lfdr.de>; Wed,  1 Feb 2023 16:55:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3B5740A5C;
	Wed,  1 Feb 2023 15:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3B5740A5C
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=solid-run-com.20210112.gappssmtp.com header.i=@solid-run-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=PTfauKBu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A9ATkg38UdpB; Wed,  1 Feb 2023 15:55:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BB59840A35;
	Wed,  1 Feb 2023 15:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB59840A35
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04905C007C;
	Wed,  1 Feb 2023 15:55:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09EE0C002B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Feb 2023 15:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4D9B81ED7
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Feb 2023 15:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4D9B81ED7
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=solid-run-com.20210112.gappssmtp.com
 header.i=@solid-run-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=PTfauKBu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XzvcnL8xteqt
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Feb 2023 15:55:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBF3081E0A
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBF3081E0A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Feb 2023 15:55:30 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 t12-20020a17090aae0c00b00229f4cff534so3652437pjq.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 01 Feb 2023 07:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solid-run-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UKN0hCxvbVEoS1CGwDslwENkRBIYFzof8kgYWh+ErNQ=;
 b=PTfauKBugbwxPF1ppL2NcF8OCLSPY7KPya1L/9+KIZUGVsAKGgxYna+k6lBTmoNqg2
 o8XhJKvK1cpgezAocJxaxfBgAogqMMd92JjL55YSRdXcWKqKHGWmSFx89FTP5C1gbYLi
 LHPzY6bJ+6yGCzB98ff1b9Oxps1+0KZMVY5FIe5st9BElvXOVjOT4SPAc5Ba+JSI09TY
 A9PTuNFsl7SyX6FF6h+7gcQ2S5CxLovm3IbIDxtJajcW7TAaafz1t7ZFkXidgoJl0r8T
 NnWlDZ36SiGUInMtlK4C7+qKBdkb0pOzytHaiNxyEDzAkpkk0NMwYd99HrIZTrIlPEI4
 d2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UKN0hCxvbVEoS1CGwDslwENkRBIYFzof8kgYWh+ErNQ=;
 b=gU95MvlrLfziZiJN8mW4r4aPbPGRuvakKRbXu4LHHwMO302eZbZ56B85CC3UqSQqnJ
 91td+u3F42oAqTVypz8okXPlMV0xzY8q4WhilPpJlQrYpEpXIhVt0g0rb8ehiK89KUlc
 Z5MmNRfCZk6aGSzXF3QEX1F2Nzwgn3Q/2SFJxwEoEpl7kSTiWiU+YaX6qixbfDvdMshm
 WbJPFxk2LPiXdesRtjcuJ7qo8s2MY21UhuU38V2pVALtTMiv62rGnkznrJ6FzSkHCGeu
 CLvQ32aD/jAOfzwfSbvb79XCGkWB2LujFGVFsVbCimsyDGCNfmxlLVXDcQKrozsDu/6j
 81Xg==
X-Gm-Message-State: AO0yUKWW3SUmGBxk78mjC+mwZyrWdON+Asxu5e6g9F43RJ2G4oJp2duL
 SL8DSkam9FnYUB/MEcEeUJpEMVXrsGTjekQBJM/Trg==
X-Google-Smtp-Source: AK7set+5sivLmBoHQHDMXaqW2OIVufOpfEJc2w0WYvzyCi4CALl0D3F2RP4pgqgdx4UdJEB5LutPDmJ0CbjzNLUdkSQ=
X-Received: by 2002:a17:90a:670c:b0:22c:46e:6510 with SMTP id
 n12-20020a17090a670c00b0022c046e6510mr509931pjj.9.1675266930255; Wed, 01 Feb
 2023 07:55:30 -0800 (PST)
MIME-Version: 1.0
References: <20230201152018.1270226-1-alvaro.karsz@solid-run.com>
 <20230201105200-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230201105200-mutt-send-email-mst@kernel.org>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Wed, 1 Feb 2023 17:54:53 +0200
Message-ID: <CAJs=3_Bw5QiZRu-nSeprhT1AMyGqw4oggTY=t+yaPeXBOAOjLQ@mail.gmail.com>
Subject: Re: [PATCH] vhost-vdpa: print error when vhost_vdpa_alloc_domain fails
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: netdev@vger.kernel.org, Eugenio Perez Martin <eperezma@redhat.com>,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

> I'm not sure this is a good idea. Userspace is not supposed to be
> able to trigger dev_err.

dev_warn then?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
