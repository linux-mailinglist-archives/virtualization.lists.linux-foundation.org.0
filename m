Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B73826A01A
	for <lists.virtualization@lfdr.de>; Tue, 15 Sep 2020 09:47:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C2756870A2;
	Tue, 15 Sep 2020 07:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a7cHs-gJm++B; Tue, 15 Sep 2020 07:47:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E0A987091;
	Tue, 15 Sep 2020 07:47:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B01AC0051;
	Tue, 15 Sep 2020 07:47:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5920AC0051
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 07:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 54EFC87091
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 07:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZfOpZjPnxsAo
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 07:47:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 61E4C8708D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 07:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600156047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nTp+0adIMlkbx1qsm74sDSR5UPl/diwwLvQ0udN7+Fk=;
 b=af4xiQMw5E9QQouDc7hzi0+ttmztTPTpUiSWOViXgAz6g6mCl26ziyPoZRjuIUjBDkzSdi
 mltPDIxjuVLojtKtZ9XcTcrTK7DJIyHrHpJSiBx22VmfJnliogdl6uSceo9VAtKbE1LwfE
 aySbLk38SnsRoprd68uDaxNGsGIB0Y4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-bFYMHfc7Pzm1PAvS72QZsQ-1; Tue, 15 Sep 2020 03:47:25 -0400
X-MC-Unique: bFYMHfc7Pzm1PAvS72QZsQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CD638030C7;
 Tue, 15 Sep 2020 07:47:24 +0000 (UTC)
Received: from [10.72.13.94] (ovpn-13-94.pek2.redhat.com [10.72.13.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3093B27BC0;
 Tue, 15 Sep 2020 07:47:17 +0000 (UTC)
Subject: Re: [PATCH] vhost_vdpa: Fix duplicate included kernel.h
To: Tian Tao <tiantao6@hisilicon.com>, mst@redhat.com, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
References: <1600131102-24672-1-git-send-email-tiantao6@hisilicon.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d351bfb1-bc39-c63b-2124-29dcafe017ee@redhat.com>
Date: Tue, 15 Sep 2020 15:47:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1600131102-24672-1-git-send-email-tiantao6@hisilicon.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: linuxarm@huawei.com
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

Ck9uIDIwMjAvOS8xNSDkuIrljYg4OjUxLCBUaWFuIFRhbyB3cm90ZToKPiBsaW51eC9rZXJuZWwu
aCBpcyBpbmNsdWRlZCBtb3JlIHRoYW4gb25jZSwgUmVtb3ZlIHRoZSBvbmUgdGhhdCBpc24ndAo+
IG5lY2Vzc2FyeS4KPgo+IFNpZ25lZC1vZmYtYnk6IFRpYW4gVGFvIDx0aWFudGFvNkBoaXNpbGlj
b24uY29tPgo+IC0tLQo+ICAgZHJpdmVycy92aG9zdC92ZHBhLmMgfCAxIC0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92ZHBh
LmMgYi9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+IGluZGV4IDNmYWI5NGYuLjk1ZTJiODMgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy92aG9zdC92ZHBhLmMKPiArKysgYi9kcml2ZXJzL3Zob3N0L3ZkcGEu
Ywo+IEBAIC0yMiw3ICsyMiw2IEBACj4gICAjaW5jbHVkZSA8bGludXgvbm9zcGVjLmg+Cj4gICAj
aW5jbHVkZSA8bGludXgvdmhvc3QuaD4KPiAgICNpbmNsdWRlIDxsaW51eC92aXJ0aW9fbmV0Lmg+
Cj4gLSNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiAgIAo+ICAgI2luY2x1ZGUgInZob3N0Lmgi
Cj4gICAKCgpBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlv
biBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVh
bGl6YXRpb24=
