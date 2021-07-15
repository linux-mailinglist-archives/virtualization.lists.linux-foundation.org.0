Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 090D83C97F6
	for <lists.virtualization@lfdr.de>; Thu, 15 Jul 2021 07:01:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 257F74224B;
	Thu, 15 Jul 2021 05:01:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KALmUOz4ukTM; Thu, 15 Jul 2021 05:01:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E76EB4224C;
	Thu, 15 Jul 2021 05:01:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 601C2C0022;
	Thu, 15 Jul 2021 05:01:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59EA1C000E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Jul 2021 05:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 477DE83D31
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Jul 2021 05:01:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ec_OiZuqHijR
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Jul 2021 05:01:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 512FD83D30
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Jul 2021 05:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626325275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WtjoUKLcgmL3bnw/gxqCJv6EYfcYaY0E3bn8JDpe3PI=;
 b=HGBLkOX+IZpd9PDeczkUWAdzxkUB6jF+BaMjpI7N1m38DiQuOUKRwW869N/rf4muIE+R7N
 9KBfNt4KWhZWBDpNk6+kT1JzHD6SZAzlLmJfX1/HrHyGMdmNNnF5OIw4cQPu7VkM/IlxX6
 ZxmEcM+pWRmcoghNunOq3wxIMhDCZpE=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-RcvpiGxZMcuxnYRdXoFZyQ-1; Thu, 15 Jul 2021 01:01:13 -0400
X-MC-Unique: RcvpiGxZMcuxnYRdXoFZyQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 4-20020a17090a1a44b029016e8392f557so5078445pjl.5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 22:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=WtjoUKLcgmL3bnw/gxqCJv6EYfcYaY0E3bn8JDpe3PI=;
 b=WOzWAyBy8WFteRrKzH47Tt7pRWzXcZMceI2SgZ5PgDM3GFYd2C8DthTym7MwjnFqqT
 voAv+ZnR3/rgkeWTc0Rmsy7riLCAcXr8lKmvSOaWnPveDXi2CjgvCZcTe19Sa16zKRzs
 hQIVnGQ5WqCrTjuhfMctY8H0CP5mXxAcQG7y5JCrigEXJ3r87wPLgks/+Cv3y5QyVNxf
 tY2xv/wzdTufIsd3cg9CEpx32xpxgPfZkME1IMbdpsL679VWo7qGpWSS5TjQ/0YpZN5H
 OJ2zDqkRpbLYI8NCDt/v8YInkgMus+thAW0tMASOKtVrXLBjtN8zutohV3dZZ5GP1lzm
 wHFA==
X-Gm-Message-State: AOAM5324iAu3Ba0NPbDIXobnB62ebmjkk4YRCldQyPPbxHXfFPrWT9pc
 +Elhr/+VvK3C0Jlp7qWULnwy41jFEiDK7017/6C78kshPbwMqQUJpgEWS8mJQoA4gMDu/LjJpCp
 QBqerS0Dhu0KtF7WbiWeellwSlYGaoptsT8jKFPz7Aw==
X-Received: by 2002:a63:1e5c:: with SMTP id p28mr2391176pgm.3.1626325272857;
 Wed, 14 Jul 2021 22:01:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkpF4TSDI5DZm/B2bv9bWVuNXDKhmhRtseurS2rxggrCDnmBokVeS6bdawuICnE0MaFRu/xw==
X-Received: by 2002:a63:1e5c:: with SMTP id p28mr2391148pgm.3.1626325272634;
 Wed, 14 Jul 2021 22:01:12 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id o20sm5070990pgv.80.2021.07.14.22.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 22:01:12 -0700 (PDT)
Subject: Re: [PATCH v9 16/17] vduse: Introduce VDUSE - vDPA Device in Userspace
To: Yongji Xie <xieyongji@bytedance.com>
References: <20210713084656.232-1-xieyongji@bytedance.com>
 <20210713084656.232-17-xieyongji@bytedance.com>
 <26116714-f485-eeab-4939-71c4c10c30de@redhat.com>
 <CACycT3uh+wUeDM1H7JiCJTMeCVCBngURGKeXD-h+meekNNwiQw@mail.gmail.com>
 <ec3e2729-3490-851f-ed4b-6dee9c04831c@redhat.com>
 <CACycT3vTyR=+6xOJyXCu_bGAKcz4Fx3bA25WfdBjhxJ6MOvLzw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5d756360-b540-2faf-6e52-e7e6e863ca0b@redhat.com>
Date: Thu, 15 Jul 2021 13:00:56 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACycT3vTyR=+6xOJyXCu_bGAKcz4Fx3bA25WfdBjhxJ6MOvLzw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: kvm <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Christian Brauner <christian.brauner@canonical.com>,
 Jonathan Corbet <corbet@lwn.net>, joro@8bytes.org,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Liu Xiaodong <xiaodong.liu@intel.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Stefan Hajnoczi <stefanha@redhat.com>, songmuchun@bytedance.com,
 Jens Axboe <axboe@kernel.dk>, He Zhe <zhe.he@windriver.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 bcrl@kvack.org, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 =?UTF-8?Q?Mika_Penttil=c3=a4?= <mika.penttila@nextfour.com>
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

CuWcqCAyMDIxLzcvMTUg5LiL5Y2IMTI6MDMsIFlvbmdqaSBYaWUg5YaZ6YGTOgo+PiBXaGljaCBp
b2N0bCBjYW4gYmUgdXNlZCBmb3IgdGhpcz8KPj4KPiBJIG1lYW4gd2UgY2FuIGludHJvZHVjZSBh
IG5ldyBpb2N0bCBmb3IgdGhhdCBpbiB0aGUgZnV0dXJlLgoKCk9rLCBJIHNlZS4KCgo+Cj4+Pj4g
SSB3b25kZXIgaWYgaXQncyBiZXR0ZXIgdG8gZG8gc29tZXRoaW5nIHNpbWlsYXIgdG8gY2N3Ogo+
Pj4+Cj4+Pj4gMSkgcmVxdWlyZXMgdGhlIHVzZXJzcGFjZSB0byB1cGRhdGUgdGhlIHN0YXR1cyBi
aXQgaW4gdGhlIHJlc3BvbnNlCj4+Pj4gMikgdXBkYXRlIHRoZSBkZXYtPnN0YXR1cyB0byB0aGUg
c3RhdHVzIGluIHRoZSByZXNwb25zZSBpZiBubyB0aW1lb3V0Cj4+Pj4KPj4+PiBUaGVuIHVzZXJz
cGFjZSBjb3VsZCB0aGVuIHNldCBORUVEU19SRVNFVCBpZiBuZWNlc3NhcnkuCj4+Pj4KPj4+IEJ1
dCBORUVEU19SRVNFVCBkb2VzIG5vdCBvbmx5IGhhcHBlbiBpbiB0aGlzIGNhc2UuCj4+IFllcywg
c28geW91IG5lZWQgYW4gaW9jdGwgZm9yIHVzZXJzcGFjZSB0byB1cGRhdGUgdGhlIGRldmljZSBz
dGF0dXMKPj4gKE5FRURTX1JFU0VUKSBwcm9iYWJseS4KPj4KPiBZZXMsIGJ1dCBJJ2QgbGlrZSB0
byBkbyB0aGF0IGFmdGVyIHRoZSBpbml0aWFsIHZlcnNpb24gaXMgbWVyZ2VkIHNpbmNlCj4gTkVF
RFNfUkVTRVQgaXMgbm90IHN1cHBvcnRlZCBub3cuCgoKUmlnaHQuCgpUaGFua3MKCgo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlv
biBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVh
bGl6YXRpb24=
