Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 90693193826
	for <lists.virtualization@lfdr.de>; Thu, 26 Mar 2020 06:52:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9BA00215DF;
	Thu, 26 Mar 2020 05:52:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7TtCdycYAMob; Thu, 26 Mar 2020 05:52:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E546721FF8;
	Thu, 26 Mar 2020 05:52:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D01BDC0177;
	Thu, 26 Mar 2020 05:52:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C189FC0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 05:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BC5B38831F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 05:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8SVfskqcauN6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 05:52:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BED8C8832A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 05:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585201925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nHSCTCOpueCpiOWznPRR+Xn/UI1HYzEARRPs1NvUwTk=;
 b=BPq/fVQd7hFlrh7J3PImINEcj6DIynvs81RwDTjals9U4xHi5PfvWpQo0QX4nhrk/Xv62y
 T4NmdpWYpVytAlUxsDbcNvsF24wJR0jpTD6d2ZeYx1fAkjPfNByw1ZFh53P34ktBPdhIjx
 q8JsoME61fYA+mSAingPA1jbr7YegFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-3eHxDwQyNnWQi176UfAy4A-1; Thu, 26 Mar 2020 01:52:01 -0400
X-MC-Unique: 3eHxDwQyNnWQi176UfAy4A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAF121005510;
 Thu, 26 Mar 2020 05:51:58 +0000 (UTC)
Received: from [10.72.13.193] (ovpn-13-193.pek2.redhat.com [10.72.13.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 149D2A0A87;
 Thu, 26 Mar 2020 05:51:42 +0000 (UTC)
Subject: Re: [PATCH V8 5/9] vDPA: introduce vDPA bus
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200325082711.1107-1-jasowang@redhat.com>
 <20200325082711.1107-6-jasowang@redhat.com>
 <20200325122949.GW13183@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a1474a55-7525-7c3e-a806-e3f53850a590@redhat.com>
Date: Thu, 26 Mar 2020 13:51:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200325122949.GW13183@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: kvm@vger.kernel.org, mst@redhat.com, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, shahafs@mellanox.com, parav@mellanox.com,
 vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
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

Ck9uIDIwMjAvMy8yNSDkuIvljYg4OjI5LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gV2Vk
LCBNYXIgMjUsIDIwMjAgYXQgMDQ6Mjc6MDdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4g
K3N0cnVjdCB2ZHBhX2RldmljZSAqX192ZHBhX2FsbG9jX2RldmljZShzdHJ1Y3QgZGV2aWNlICpw
YXJlbnQsCj4+ICsJCQkJCWNvbnN0IHN0cnVjdCB2ZHBhX2NvbmZpZ19vcHMgKmNvbmZpZywKPj4g
KwkJCQkJc2l6ZV90IHNpemUpOwo+PiArCj4+ICsjZGVmaW5lIHZkcGFfYWxsb2NfZGV2aWNlKGRl
dl9zdHJ1Y3QsIG1lbWJlciwgcGFyZW50LCBjb25maWcpICAgXAo+PiArCQkJICBjb250YWluZXJf
b2YoX192ZHBhX2FsbG9jX2RldmljZSggXAo+PiArCQkJCSAgICAgICBwYXJlbnQsIGNvbmZpZywg
XAo+PiArCQkJCSAgICAgICBzaXplb2Yoc3RydWN0IGRldl9zdHJ1Y3QpICsgXAo+PiArCQkJCSAg
ICAgICBCVUlMRF9CVUdfT05fWkVSTyhvZmZzZXRvZiggXAo+PiArCQkJCSAgICAgICBzdHJ1Y3Qg
ZGV2X3N0cnVjdCwgbWVtYmVyKSkpLCBcCj4+ICsJCQkJICAgICAgIHN0cnVjdCBkZXZfc3RydWN0
LCBtZW1iZXIpCj4gVGhpcyBhbGwgbG9va3Mgcm9idXN0IG5vdywgb25lIG1pbm9yIHJlbWFyayBp
cyB0byBub3QgZG8gJ3N0cnVjdAo+IGRldl9zdHJ1Y3QnIGhlcmUgc28gdGhlIGNhbGxlciBoYXMg
dG8gZG8KPgo+ICAgICB2ZHBhX2FsbG9jX2RldmljZShzdHJ1Y3QgZm9vLCB2cGRhLCAuLi4pCj4K
PiBXaGljaCBzdWdnZXN0cyB0byB0aGUgcmVhZGVyIHNvbWV0aGluZyB1bnVzdWFsIGlzIGhhcHBl
bmluZwo+Cj4gSmFzb24KCgpZZXMsIHRoYXQncyBiZXR0ZXIuCgpCdXQgbXkgdW5kZXJzdGFuZGlu
ZyBpcyB0aGF0IHRoaXMgY2FuIGJlIGRvbmUgb24gdG9wLgoKVGhhbmtzCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
