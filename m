Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 292A23BE2A9
	for <lists.virtualization@lfdr.de>; Wed,  7 Jul 2021 07:39:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FDAA82B1A;
	Wed,  7 Jul 2021 05:39:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jqE_QabbtrPO; Wed,  7 Jul 2021 05:39:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8F3B782B34;
	Wed,  7 Jul 2021 05:39:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DCEBC000E;
	Wed,  7 Jul 2021 05:39:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB668C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Jul 2021 05:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA4F940375
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Jul 2021 05:39:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oclds52DPw_p
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Jul 2021 05:39:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFAB24035C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Jul 2021 05:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625636342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kGTF9aX4UU8SQB/ux5DynjlqPbikwmwfckJttBuZsBQ=;
 b=Y87fkuLvfsUyb+ysOfqCIpuZ61rSRItbkozm/joT4BbiT2SZkEBYoxDsjQUMEwnq2x5GbL
 YxiHRPxWQqeZCLhyOQdQloYIl81wHT2q+7XWxbtV5P4L3XDRm7rrvD7kpNoAk3ieYkRHSs
 6nzLRDjZbR3t7X11wY0Qr33M579kJHw=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-qoha2ZleO-iVDRXJr2CUZg-1; Wed, 07 Jul 2021 01:38:58 -0400
X-MC-Unique: qoha2ZleO-iVDRXJr2CUZg-1
Received: by mail-pj1-f69.google.com with SMTP id
 k92-20020a17090a14e5b02901731af08bd7so853154pja.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 06 Jul 2021 22:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=kGTF9aX4UU8SQB/ux5DynjlqPbikwmwfckJttBuZsBQ=;
 b=RqL7InAP09Ir18eEFwWxcwMC9ERMeV+jn9Le/0ZdLoZ6YljlJSnzsi/OV6g7ZDA+os
 fwshA4YGvt8MPN4x/PYcvSRrLpmm10E58nWbSHpmf9jrJk5FSrYJ7asSi+bw8uoUQQor
 wVPnP5h7qE2JekcVcZV4x/OYlWLDmDVM66zM4pkPVmMf0URZS2DaXVRkTVvIj5JvtlKX
 2fNJr0kCkNUduJPq789DVQQdjI+gEsEUTfD+rZ+X/M4W/bnPqCHDUnduVVKiRuJ5H+IW
 ch9wrXRW4JYDT/35J0XwYRoLBzRhXChondB+t+LcvT1SeUXvGYJ3GGZGsvlyKdbGhcT0
 GQZg==
X-Gm-Message-State: AOAM5334ysrwKj4uwrRCZqrrS742EaAxPQHSxttkkBIXB49Vq8Wneoli
 wB2d3dMsSdI9OnsezlH02BG9a8LOsYroThE7NO6HidiDPGuuM8ec0ap3LiK5Yx2w304MWze5lQt
 JhoWSNfdh5ckcEpIE/jv9oNXP5FwnexdCFDpDq4Fqbw==
X-Received: by 2002:a63:d709:: with SMTP id d9mr24915999pgg.337.1625636337943; 
 Tue, 06 Jul 2021 22:38:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdcAYzPe9Td2iDIGFQQSaewh4hvbPDcFQ56fjCZjz8xFGYhjP3HXr2pwcyE40/rv2oyxP9Dg==
X-Received: by 2002:a63:d709:: with SMTP id d9mr24915987pgg.337.1625636337752; 
 Tue, 06 Jul 2021 22:38:57 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id pj4sm4703749pjb.18.2021.07.06.22.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 22:38:57 -0700 (PDT)
Subject: Re: [PATCH 1/2] vdpa: support per virtqueue max queue size
To: Yongji Xie <xieyongji@bytedance.com>
References: <20210705071910.31965-1-jasowang@redhat.com>
 <CACycT3tMd750PQ0mgqCjHnxM4RmMcx2+Eo=2RBs2E2W3qPJang@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f655025b-5db4-a146-ff85-a211576e29af@redhat.com>
Date: Wed, 7 Jul 2021 13:38:52 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACycT3tMd750PQ0mgqCjHnxM4RmMcx2+Eo=2RBs2E2W3qPJang@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: kvm <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CuWcqCAyMDIxLzcvNyDkuIvljYgxMjowNCwgWW9uZ2ppIFhpZSDlhpnpgZM6Cj4+ICAgc3RhdGlj
IGxvbmcgdmhvc3RfdmRwYV9nZXRfdnJpbmdfbnVtKHN0cnVjdCB2aG9zdF92ZHBhICp2LCB1MTYg
X191c2VyICphcmdwKQo+PiAgIHsKPj4gLSAgICAgICBzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEg
PSB2LT52ZHBhOwo+PiAtICAgICAgIGNvbnN0IHN0cnVjdCB2ZHBhX2NvbmZpZ19vcHMgKm9wcyA9
IHZkcGEtPmNvbmZpZzsKPj4gICAgICAgICAgdTE2IG51bTsKPj4KPj4gLSAgICAgICBudW0gPSBv
cHMtPmdldF92cV9udW1fbWF4KHZkcGEpOwo+PiArICAgICAgIC8qCj4+ICsgICAgICAgICogVkhP
U1RfVkRQQV9HRVRfVlJJTkdfTlVNIGFzc3N1bWVzIGEgZ2xvYmFsIG1heCB2aXJ0cXVldWUKPiBz
L2Fzc3N1bWVzL2Fzc3VtZXMuIE90aGVyIGxvb2tzIGdvb2QgdG8gbWUuCj4KPiBUaGFua3MsCj4g
WW9uZ2ppCj4KCldpbGwgZml4LgoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
