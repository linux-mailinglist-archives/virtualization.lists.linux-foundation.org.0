Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E422C2B4000
	for <lists.virtualization@lfdr.de>; Mon, 16 Nov 2020 10:41:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E3BA82004;
	Mon, 16 Nov 2020 09:41:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6KfB-c4MD1t8; Mon, 16 Nov 2020 09:41:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D0FAC85948;
	Mon, 16 Nov 2020 09:41:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A31E1C07FF;
	Mon, 16 Nov 2020 09:41:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D0B7C07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 09:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2239A2010C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 09:41:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cv9ftMJowv6e
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 09:41:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 0135E1FC7D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 09:41:22 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id y7so13566095pfq.11
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 01:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6fzRGcF2f5tFoFwvys8VZBGWlajGvKg0DJjdpbzuzA0=;
 b=O0zaiLKi1+9kzKuXt6zMbdQp7SWpKVbP5X+apVBf1Ka0Sv193qIywfMTjjObYceO/x
 4TMxVq3CmbgKaS+TzuJ8VPZY/4QSz703OazPWQ0Utr9gXbGLgwrO2FKbHfhwmxO1yiEX
 +zZ1kIo8FczNcuSVIkPyfHJZLG7tGGNSenBpFgEYCCsEQ75gtMsVV3odtNArzljpXDAM
 NoNE2KEMAc4mZxyNqLKkP9r/AmH8ofDHWve8hw/S8GEgXcqIw1U5llg/5QdOSOn9Ivf9
 5u0ZPw7riMlWYPo50/1g3Ufft+U6OKw/b48035moyungQ2zDVcCdDzTehjdf9k05Ne17
 j+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6fzRGcF2f5tFoFwvys8VZBGWlajGvKg0DJjdpbzuzA0=;
 b=rUuYT8K36cUXh+wDExkce/SN/rRU6cFiYabcv3FoWfu9SvoZvdPaaq4twoD5tvBmI6
 uXhsksqGL44A1hChA/+1MznbKB7x8MLs2/ymkv7CBp3enp28aqMqA7GfaJZVcXI/LeD9
 4hvmTb50jux5XOxvGtu7LKLzMQY2IoOQ405ZSCpVsvkbW67joxwJ+zG6JtInZYbRU2pd
 y4nXCsQszO22Xd7hSoku610OP3jRFZWBwwtNtNx8kZro2VsMvOAaLpivJoVFKwUOQzK6
 og7EFtkDEB+LhyBEkm+rXgNO5zSPUOmp6FxAWgU4mkxcON5RvMe71Je8qHrABNWWuWqg
 hkDg==
X-Gm-Message-State: AOAM5314IImbQVzkR7/xvkt5yEL/ROhtzJEnwKyney1cbrVNF8Hfmfij
 i2kDyw35ElGSobfuWa2v7pE5xWFpyN/6oWf44to=
X-Google-Smtp-Source: ABdhPJwLKgoLxaacjkG7SIPtuYJkviJKA9xPpSof+g1KvR10O+DaOAcWHUOjKYEXWTbI1BD4y+7CmXKaI5ipjoUk2n0=
X-Received: by 2002:a62:7bcc:0:b029:18b:5859:d5e1 with SMTP id
 w195-20020a627bcc0000b029018b5859d5e1mr12906812pfc.40.1605519682660; Mon, 16
 Nov 2020 01:41:22 -0800 (PST)
MIME-Version: 1.0
References: <20201112064005.349268-1-parav@nvidia.com>
In-Reply-To: <20201112064005.349268-1-parav@nvidia.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 16 Nov 2020 09:41:11 +0000
Message-ID: <CAJSP0QXN2VGgKwQ_qL3Fr0dAYDviZcFDgUrE8FhHZwBm9wpBoQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] Introduce vdpa management tool
To: Parav Pandit <parav@nvidia.com>
Cc: netdev@vger.kernel.org, elic@nvidia.com,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>
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

Great! A few questions and comments:

How are configuration parameters passed in during device creation
(e.g. MAC address, number of queues)?

Can configuration parameters be changed at runtime (e.g. link up/down)?

Does the configuration parameter interface distinguish between
standard and vendor-specific parameters? Are they namespaced to
prevent naming collisions?

How are software-only parent drivers supported? It's kind of a shame
to modprobe unconditionally if they won't be used. Does vdpatool have
some way of requesting loading a parent driver? That way software
drivers can be loaded on demand.

What is the benefit of making it part of iproute2? If there is not a
significant advantage like sharing code, then I suggest using a
separate repository and package so vdpatool can be installed
separately (e.g. even on AF_VSOCK-only guests without Ethernet).

Stefan
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
