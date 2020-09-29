Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6F227BFC4
	for <lists.virtualization@lfdr.de>; Tue, 29 Sep 2020 10:40:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 21700870CE;
	Tue, 29 Sep 2020 08:40:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ghevo1OvP8X0; Tue, 29 Sep 2020 08:40:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AB4B4870C9;
	Tue, 29 Sep 2020 08:40:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7112FC0051;
	Tue, 29 Sep 2020 08:40:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98A5BC0051
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 08:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 92A4985E27
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 08:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vzutwn9fMDgK
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 08:40:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 65BEE85E25
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 08:40:24 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id e2so2459867vsr.7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 01:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AXj/2yxnGnqCJt2X6VbEHmHDtztk3H2f7Rx1q9RXDZI=;
 b=BQOT5WZ3Z+bOTnWz8gvG12jKNxVN59x2UlU8MSp+/urX8FyRHPSz1Vjv0aV/bXeKh1
 qUeLnj6QJBE673kmQDSxu4mwrjTHsJdWbtVsOmFFjXcRjYKFli6woTYF2wKzUamEr7gf
 3eYd2cZiXZjLXBWCAc2pGxXa/WM961m8Y0l6iChOO4hZmwsziiXDaMFCieMqn1PTmi8Q
 i4S3N1bHKw6wUtUYJ1lLhaHViCQQ7bUp/0iwJl3URLuAnXprBvNkCROuPbvNAjE99WoQ
 yZLBV0JD+pnh4/lEKwF9jy2e47YzklkZLR2qpJ51q1cc5MT/2YYC2ssOW0uBTLpEM5TK
 erzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AXj/2yxnGnqCJt2X6VbEHmHDtztk3H2f7Rx1q9RXDZI=;
 b=XtFCfzFHUbdphtvD0u+8OOwMDeUHg6p1URgs7ZWro694ZJ3i8QqVjeip8DCfAg/Byn
 TWFMEuEMBrshq6EF0nOTPNQ/uhyBRMNYH61hqYFOAmVuxYTpD76x4mjCXLNUl02wECQ3
 GcRo3d8AQEx+SGLk7BHH9d/BhM3i1Os02iY3xt7h/h8oteCLtP55UuESNSvPwGAB1gSv
 TzQqGUSBncNXRueKjkH3gAtD+cUiTgFb3u9C8NMZvDrOvQGCAzCtQjNWEUNpmJb+NcOY
 vj7COxl4dfXFleUvUcBCkY0Mf6uFw+suSqJao5exHQtnwHI48us1b2Q2Y7U0TXNVmQzB
 s2qg==
X-Gm-Message-State: AOAM530G0pHPHpWA/PUx431uwHl0V+M5YqgLjkNvepLwH8S/CiC+DqUJ
 JazaWTIBhRhsS4HNgN3v24270TQTQ8Rjcg==
X-Google-Smtp-Source: ABdhPJx8mTwGO9pxEMvPu9MlraRMIwRuOJPIE4JAUuNU8uzTclkW+oKVA2M1rKW/U55R/p/wcI6u8w==
X-Received: by 2002:a67:ea88:: with SMTP id f8mr2287330vso.2.1601368822840;
 Tue, 29 Sep 2020 01:40:22 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com.
 [209.85.217.41])
 by smtp.gmail.com with ESMTPSA id a64sm479460vkh.3.2020.09.29.01.40.21
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2020 01:40:22 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id 5so2465886vsu.5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 01:40:21 -0700 (PDT)
X-Received: by 2002:a67:8a8a:: with SMTP id m132mr2059005vsd.14.1601368821464; 
 Tue, 29 Sep 2020 01:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200929015806.19171-1-xiangxia.m.yue@gmail.com>
In-Reply-To: <20200929015806.19171-1-xiangxia.m.yue@gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Tue, 29 Sep 2020 10:39:46 +0200
X-Gmail-Original-Message-ID: <CA+FuTSfjMQXLN6nvTu+P8r1eUt=Sw56GDqwGG+tuKK3pF5U9jQ@mail.gmail.com>
Message-ID: <CA+FuTSfjMQXLN6nvTu+P8r1eUt=Sw56GDqwGG+tuKK3pF5U9jQ@mail.gmail.com>
Subject: Re: [PATCH net v2] virtio-net: don't disable guest csum when disable
 LRO
To: Tonghao Zhang <xiangxia.m.yue@gmail.com>
Cc: Network Development <netdev@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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

On Tue, Sep 29, 2020 at 4:00 AM <xiangxia.m.yue@gmail.com> wrote:
>
> From: Tonghao Zhang <xiangxia.m.yue@gmail.com>
>
> Open vSwitch and Linux bridge will disable LRO of the interface
> when this interface added to them. Now when disable the LRO, the
> virtio-net csum is disable too. That drops the forwarding performance.
>
> Fixes: a02e8964eaf9 ("virtio-net: ethtool configurable LRO")
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Tonghao Zhang <xiangxia.m.yue@gmail.com>

Acked-by: Willem de Bruijn <willemb@google.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
