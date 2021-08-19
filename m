Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0551F3F123C
	for <lists.virtualization@lfdr.de>; Thu, 19 Aug 2021 06:11:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A556405C0;
	Thu, 19 Aug 2021 04:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mPjnaeIwuDE2; Thu, 19 Aug 2021 04:11:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5FA204056D;
	Thu, 19 Aug 2021 04:11:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 044CBC0022;
	Thu, 19 Aug 2021 04:11:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 626DFC000E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Aug 2021 04:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44EF480EBB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Aug 2021 04:11:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s2FVWBwKqOv7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Aug 2021 04:11:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6ED0980EBA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Aug 2021 04:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629346278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VBYriaxQXLlAIO2jBLfdlJqsXE4thEUkTkWuNBb3xSE=;
 b=ePr9loYHT87kwKb/l2sLt0nKRdwKM3779GVG7yQD8ya0EXZ8eij8fBF2EPOPyYv2KL9vZY
 TOaVMqFlCTOeGs0042zdujQCKa25HRQ5t3QdSCKqhGxPiOiIKGGkNkNkJ30GmvcZkguRdP
 FR5zLCFH212xhE1i8Jta3g9nQ3Hb/N0=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-JaqT4llXNJu5DrM9XcYDug-1; Thu, 19 Aug 2021 00:11:14 -0400
X-MC-Unique: JaqT4llXNJu5DrM9XcYDug-1
Received: by mail-pf1-f197.google.com with SMTP id
 q16-20020a056a000890b029034691245625so2424777pfj.10
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 21:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=VBYriaxQXLlAIO2jBLfdlJqsXE4thEUkTkWuNBb3xSE=;
 b=XONmKG5RtMQmSPjMTXgVbE2VhYeyqBalGIqg5nM2gUg9M+UHCibnApYRUjS7MTatE6
 +kGMl5rAJ5GrEJowmMzPoiyQZ2VdS99bMIuhye32vzECo0Ly1at7RZtYz+a2VL2igvAv
 MP/z+EtWZyZQT7icdJkHk9XpgWwSGYmb608wyeiL73OirRwnT3BsgZsoyJPM3SZpup9w
 IFiJj2TVTqgCFJZ4pIPYytQF4+ztKQvqlBKmgNZfxG3GIvN14aJo89oN1JjXY4V2ukX3
 1ktEFlKoBS/ATGEE3UFM9QXYF+yM4CWFVUdPioIuFzYXOTx6ILvQddl8I9/wfRO0x7UX
 hg1A==
X-Gm-Message-State: AOAM531BKamy7/P897LocGieBuFbaEg182T8aEaeWlnFszi9RfJN+jXf
 8XpbrsxI6wll0Pz5WnUe0bskfvi83QQFPftQQlWB8M/VP1cOOcFa6DkAB99FjoWmnRZzebfRF7g
 Nc5RgIIqmimCpLVCwd9n4t9AzSXYoIUcXbat7Xp2+0A==
X-Received: by 2002:a05:6a00:1ace:b0:3e2:2a73:e0a4 with SMTP id
 f14-20020a056a001ace00b003e22a73e0a4mr12939442pfv.73.1629346273928; 
 Wed, 18 Aug 2021 21:11:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLQPUem25xDlLQ3uF4CA7Dea+zPxgfi0RExMgvKM2TveGCChyP8g6txlY/nWsye2RZ0v3/9w==
X-Received: by 2002:a05:6a00:1ace:b0:3e2:2a73:e0a4 with SMTP id
 f14-20020a056a001ace00b003e22a73e0a4mr12939432pfv.73.1629346273757; 
 Wed, 18 Aug 2021 21:11:13 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id nv11sm6500567pjb.48.2021.08.18.21.11.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 21:11:13 -0700 (PDT)
Subject: Re: [PATCH 0/2] vDPA/ifcvf: enable multiqueue and control vq
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com
References: <20210818095714.3220-1-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e3ec8ed7-84ac-73cc-0b74-4de1bb6c0030@redhat.com>
Date: Thu, 19 Aug 2021 12:11:09 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818095714.3220-1-lingshan.zhu@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

CtTaIDIwMjEvOC8xOCDPws7nNTo1NywgWmh1IExpbmdzaGFuINC0tcA6Cj4gVGhpcyBzZXJpZXMg
ZW5hYmxlcyBtdWx0aS1xdWV1ZSBhbmQgY29udHJvbCB2cSBmZWF0dXJlcwo+IGZvciBpZmN2Zi4K
Pgo+IFRoZXNlIHBhdGNoZXMgYXJlIGJhc2VkIG9uIG15IHByZXZpb3VzIHZEUEEvaWZjdmYgbWFu
YWdlbWVudCBsaW5rCj4gaW1wbGVtZW50YXRpb24gc2VyaWVzOgo+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2t2bS8yMDIxMDgxMjAzMjQ1NC4yNDQ4Ni0yLWxpbmdzaGFuLnpodUBpbnRlbC5jb20v
VC8KPgo+IFRoYW5rcyEKPgo+IFpodSBMaW5nc2hhbiAoMik6Cj4gICAgdkRQQS9pZmN2ZjogZGV0
ZWN0IGFuZCB1c2UgdGhlIG9uYm9hcmQgbnVtYmVyIG9mIHF1ZXVlcyBkaXJlY3RseQo+ICAgIHZE
UEEvaWZjdmY6IGVuYWJsZSBtdWx0aXF1ZXVlIGFuZCBjb250cm9sIHZxCj4KPiAgIGRyaXZlcnMv
dmRwYS9pZmN2Zi9pZmN2Zl9iYXNlLmMgfCAgOCArKysrKy0tLQo+ICAgZHJpdmVycy92ZHBhL2lm
Y3ZmL2lmY3ZmX2Jhc2UuaCB8IDE5ICsrKystLS0tLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvdmRw
YS9pZmN2Zi9pZmN2Zl9tYWluLmMgfCAzMiArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkK
PgoKUGF0Y2ggbG9va3MgZ29vZC4KCkkgd29uZGVyIHRoZSBjb21wYXRpYmlsaXR5LiBFLmcgZG9l
cyBpdCB3b3JrIG9uIHRoZSBxZW11IG1hc3RlciB3aXRob3V0IApjdnEgc3VwcG9ydD8gKG1xPW9m
ZiBvciBub3Qgc3BlY2lmaWVkKQoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
