Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 033F5438F1A
	for <lists.virtualization@lfdr.de>; Mon, 25 Oct 2021 08:06:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BDA740378;
	Mon, 25 Oct 2021 06:06:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4lu95oy1cb7L; Mon, 25 Oct 2021 06:06:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 404B640382;
	Mon, 25 Oct 2021 06:06:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E163CC000E;
	Mon, 25 Oct 2021 06:06:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC815C000E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Oct 2021 06:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAFC9402FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Oct 2021 06:06:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LJmq5awVoAWf
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Oct 2021 06:06:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F395C402A8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Oct 2021 06:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635142003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S6ngBkySc4cDflZTX9J/CUxTxRWnxefqLjni6yqmWLw=;
 b=cYeLiju8xclHOjYu9gDVNBWlYgoRF2mdkfllZ5vutfECpoPp3IVrUv7MUOyH4n28GGaJDV
 gGjQ1a19HnESTQYkfn94YEFW81sM0GNXLhanubWCfEKuPQoxCiwZ98b7DDMFi7jpnUZX+v
 f46zDFHTTtqEJwrkM7Z/p5IdCUYIAjg=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-ZUUFbMHoNqeCQm7YV8FN6w-1; Mon, 25 Oct 2021 02:06:41 -0400
X-MC-Unique: ZUUFbMHoNqeCQm7YV8FN6w-1
Received: by mail-pg1-f197.google.com with SMTP id
 e6-20020a637446000000b002993ba24bbaso5719709pgn.12
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Oct 2021 23:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=S6ngBkySc4cDflZTX9J/CUxTxRWnxefqLjni6yqmWLw=;
 b=0aNi88/3xoVcvqoDkfiyYPxqYUbQBUhxtc5rCD6Q+jb/5djTK9TLKJvYezG5h0Zd1A
 ZsxPrSmvO4OtgmCb0cmh870R0sZqXSIKIcaTuhFcJeWkVfhu1hVSgv5Gj5x2jyHj7ufV
 HH9fMLaWAQPP8PKZlMnuHHk4t7hQ620LQFQUXrL7yEIIAqwevwokINy/Ne88CkLJNB8n
 sL5IKTJJMJmRJ1pndeIBbbCvTNSaX6b2eeF6g4Cnni3d3m8GESn8gPbNCsBK2Yiiaj5i
 ewIkpSOiv0uoXFymLbrZsn+Dlxm2UZ+dUntJIFMQBmIJ5MHGenzXAYyJ1EegpkKffR6W
 RRcg==
X-Gm-Message-State: AOAM5324h75bkeO47p1vU+mQ1ZGXJN8OAtcO/XPDB/tMr1gsGGxD5PJU
 ppykF1RYfIqIuEoTlUAmIiuBQfPfABV8+WD8EaEhY4cfJc+CilwQ0rz3MbAG6jrGJUeHvm2vdd3
 EcFGMI6scaaCqNDbkZXbW5inVlvh5Q5m3oSjPAcNNEQ==
X-Received: by 2002:a63:b64e:: with SMTP id v14mr12138168pgt.56.1635142000264; 
 Sun, 24 Oct 2021 23:06:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2OB6yi+/cPcA1lO7PH8vsQf7KgalAIVypcxYEyjmjqe6dM2T02krmPYYstyahs1adUofNQA==
X-Received: by 2002:a63:b64e:: with SMTP id v14mr12138150pgt.56.1635141999989; 
 Sun, 24 Oct 2021 23:06:39 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id d15sm1236348pfv.22.2021.10.24.23.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 23:06:39 -0700 (PDT)
Subject: Re: [PATCH linux-next v4 3/8] vdpa: Use kernel coding style for
 structure comments
To: Parav Pandit <parav@nvidia.com>, virtualization@lists.linux-foundation.org
References: <20211021163509.6978-1-parav@nvidia.com>
 <20211021163509.6978-4-parav@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c5fc947c-864d-b1cf-bf34-fadeb3588a98@redhat.com>
Date: Mon, 25 Oct 2021 14:06:36 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211021163509.6978-4-parav@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: elic@nvidia.com, mst@redhat.com
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CtTaIDIwMjEvMTAvMjIgyc/O5zEyOjM1LCBQYXJhdiBQYW5kaXQg0LS1wDoKPiBBcyBzdWJzZXF1
ZW50IHBhdGNoIGFkZHMgbmV3IHN0cnVjdHVyZSBmaWVsZCB3aXRoIGNvbW1lbnQsIG1vdmUgdGhl
Cj4gc3RydWN0dXJlIGNvbW1lbnQgdG8gZm9sbG93IGtlcm5lbCBjb2Rpbmcgc3R5bGUuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+Cj4gUmV2aWV3ZWQt
Ynk6IEVsaSBDb2hlbiA8ZWxpY0BudmlkaWEuY29tPgoKCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxq
YXNvd2FuZ0ByZWRoYXQuY29tPgoKCj4gLS0tCj4gICBpbmNsdWRlL2xpbnV4L3ZkcGEuaCB8IDkg
KysrKysrKystCj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC92ZHBhLmggYi9pbmNsdWRlL2xpbnV4
L3ZkcGEuaAo+IGluZGV4IDkzMjYwMjBhMmM1NS4uMTExMTUzYzllZTcxIDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUvbGludXgvdmRwYS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC92ZHBhLmgKPiBAQCAt
NDA3LDEwICs0MDcsMTcgQEAgc3RydWN0IHZkcGFfbWdtdGRldl9vcHMgewo+ICAgCXZvaWQgKCpk
ZXZfZGVsKShzdHJ1Y3QgdmRwYV9tZ210X2RldiAqbWRldiwgc3RydWN0IHZkcGFfZGV2aWNlICpk
ZXYpOwo+ICAgfTsKPiAgIAo+ICsvKioKPiArICogc3RydWN0IHZkcGFfbWdtdF9kZXYgLSB2ZHBh
IG1hbmFnZW1lbnQgZGV2aWNlCj4gKyAqIEBkZXZpY2U6IE1hbmFnZW1lbnQgcGFyZW50IGRldmlj
ZQo+ICsgKiBAb3BzOiBvcGVyYXRpb25zIHN1cHBvcnRlZCBieSBtYW5hZ2VtZW50IGRldmljZQo+
ICsgKiBAaWRfdGFibGU6IFBvaW50ZXIgdG8gZGV2aWNlIGlkIHRhYmxlIG9mIHN1cHBvcnRlZCBp
ZHMKPiArICogQGxpc3Q6IGxpc3QgZW50cnkKPiArICovCj4gICBzdHJ1Y3QgdmRwYV9tZ210X2Rl
diB7Cj4gICAJc3RydWN0IGRldmljZSAqZGV2aWNlOwo+ICAgCWNvbnN0IHN0cnVjdCB2ZHBhX21n
bXRkZXZfb3BzICpvcHM7Cj4gLQljb25zdCBzdHJ1Y3QgdmlydGlvX2RldmljZV9pZCAqaWRfdGFi
bGU7IC8qIHN1cHBvcnRlZCBpZHMgKi8KPiArCWNvbnN0IHN0cnVjdCB2aXJ0aW9fZGV2aWNlX2lk
ICppZF90YWJsZTsKPiAgIAlzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7Cj4gICB9Owo+ICAgCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlv
biBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVh
bGl6YXRpb24=
