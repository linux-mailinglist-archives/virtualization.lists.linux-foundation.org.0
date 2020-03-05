Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACC5179E18
	for <lists.virtualization@lfdr.de>; Thu,  5 Mar 2020 04:02:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CFFB9848A3;
	Thu,  5 Mar 2020 03:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rVClOAF6zAF1; Thu,  5 Mar 2020 03:02:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2A28884C05;
	Thu,  5 Mar 2020 03:02:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03C63C013E;
	Thu,  5 Mar 2020 03:02:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 797BEC013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 03:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5DB9784B2D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 03:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v5-Z-mRP46fz
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 03:02:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6ED37847B8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 03:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583377334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XEOVbJdaYFn4+qqGun9jyaGeacVOn7m9fMHJ/ZdAsls=;
 b=Ioc2c1dvOvrL0mNYbDTeCMG7MaV2xVJcEROoRDW8sHYCnCPs+VttY4uoxk+lSdSQeW9fs3
 Y9c349Y4pd0jHj68lp7NSRXQ1ArjaKBpcNIDcCQqsaA92pD/xoBzk6gfsWIuOHE2lPzki7
 gabosGHflhbTK1eootQo+43jyMJvhd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-FzLP2esYM_GWbIRzFJf6Xg-1; Wed, 04 Mar 2020 22:02:10 -0500
X-MC-Unique: FzLP2esYM_GWbIRzFJf6Xg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32BB4800D48;
 Thu,  5 Mar 2020 03:02:07 +0000 (UTC)
Received: from [10.72.13.242] (ovpn-13-242.pek2.redhat.com [10.72.13.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB2E360BE0;
 Thu,  5 Mar 2020 03:01:44 +0000 (UTC)
Subject: Re: [PATCH V5 3/5] vDPA: introduce vDPA bus
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200226060456.27275-1-jasowang@redhat.com>
 <20200226060456.27275-4-jasowang@redhat.com>
 <20200304192949.GR26318@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2842e634-bb92-a901-0a64-35a4dcde22da@redhat.com>
Date: Thu, 5 Mar 2020 11:01:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200304192949.GR26318@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: kvm@vger.kernel.org, mst@redhat.com, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, haotian.wang@sifive.com, shahafs@mellanox.com,
 parav@mellanox.com, vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, netdev@vger.kernel.org, lingshan.zhu@intel.com
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

Ck9uIDIwMjAvMy81IOS4iuWNiDM6MjksIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBXZWQs
IEZlYiAyNiwgMjAyMCBhdCAwMjowNDo1NFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+PiAr
c3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhX2FsbG9jX2RldmljZShzdHJ1Y3QgZGV2aWNlICpwYXJl
bnQsCj4+ICsJCQkJICAgICAgc3RydWN0IGRldmljZSAqZG1hX2RldiwKPj4gKwkJCQkgICAgICBj
b25zdCBzdHJ1Y3QgdmRwYV9jb25maWdfb3BzICpjb25maWcpCj4+ICt7Cj4+ICsJc3RydWN0IHZk
cGFfZGV2aWNlICp2ZGV2Owo+PiArCWludCBlcnIgPSAtRU5PTUVNOwo+PiArCj4+ICsJaWYgKCFw
YXJlbnQgfHwgIWRtYV9kZXYgfHwgIWNvbmZpZykKPj4gKwkJZ290byBlcnI7Cj4+ICsKPj4gKwl2
ZGV2ID0ga3phbGxvYyhzaXplb2YoKnZkZXYpLCBHRlBfS0VSTkVMKTsKPj4gKwlpZiAoIXZkZXYp
Cj4+ICsJCWdvdG8gZXJyOwo+PiArCj4+ICsJZXJyID0gaWRhX3NpbXBsZV9nZXQoJnZkcGFfaW5k
ZXhfaWRhLCAwLCAwLCBHRlBfS0VSTkVMKTsKPj4gKwlpZiAoZXJyIDwgMCkKPj4gKwkJZ290byBl
cnJfaWRhOwo+PiArCj4+ICsJdmRldi0+ZGV2LmJ1cyA9ICZ2ZHBhX2J1czsKPj4gKwl2ZGV2LT5k
ZXYucGFyZW50ID0gcGFyZW50Owo+PiArCXZkZXYtPmRldi5yZWxlYXNlID0gdmRwYV9yZWxlYXNl
X2RldjsKPj4gKwo+PiArCWRldmljZV9pbml0aWFsaXplKCZ2ZGV2LT5kZXYpOwo+PiArCj4+ICsJ
dmRldi0+aW5kZXggPSBlcnI7Cj4+ICsJdmRldi0+ZG1hX2RldiA9IGRtYV9kZXY7Cj4+ICsJdmRl
di0+Y29uZmlnID0gY29uZmlnOwo+PiArCj4+ICsJZGV2X3NldF9uYW1lKCZ2ZGV2LT5kZXYsICJ2
ZHBhJXUiLCB2ZGV2LT5pbmRleCk7Cj4gUHJvYmFibHkgc2hvdWxkbid0IGlnbm9yZSB0aGUgZXJy
b3IgZm9yIGRldl9zZXRfbmFtZSA/Cj4KPiBlcnIgPSBkZXZfc2V0X25hbWUoKQo+IGlmIChlcnIp
IHsKPiAgICAgcHV0X2RldmljZSgmdmRldi0+ZGV2KTsKPiAgICAgcmV0dXJuIEVSUl9QVFIoZXJy
KTsKPiB9Cj4KPiBKYXNvbgo+CgpSaWdodCwgd2lsbCBmaXguCgpUaGFua3MKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
