Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CF76F16F7CC
	for <lists.virtualization@lfdr.de>; Wed, 26 Feb 2020 07:13:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0911886AC4;
	Wed, 26 Feb 2020 06:13:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1qXIraOusOAl; Wed, 26 Feb 2020 06:13:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8E73586AB1;
	Wed, 26 Feb 2020 06:13:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69F58C0177;
	Wed, 26 Feb 2020 06:13:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D20CEC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 06:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C91A285CAA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 06:13:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hjZr4wkKZeq9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 06:13:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 441B1851AA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 06:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582697588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qomx+ZbKWIrzZtErXMfwcPJrjlc3eZgjsPhGLKwY99k=;
 b=ikzo3AStrM2846tHd/S5/F/ytuVHn8z+qpwTGY8EK53fqgxvWuN3kXXuzl95M4KZIf28JZ
 hWefZKC+SCzVFyZhCds5+TrngI2OjrPDKPTF4RtqzyhDDrSoMhyldTdm+kyaCgdUEGRFRV
 aDiz701cRWmQwUVYQ0ZpTFfAyIUupO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-mlezykjlOrKrQv0WTr5MZQ-1; Wed, 26 Feb 2020 01:13:07 -0500
X-MC-Unique: mlezykjlOrKrQv0WTr5MZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4343A800053;
 Wed, 26 Feb 2020 06:13:04 +0000 (UTC)
Received: from [10.72.13.217] (ovpn-13-217.pek2.redhat.com [10.72.13.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09EC0396;
 Wed, 26 Feb 2020 06:12:30 +0000 (UTC)
Subject: Re: [PATCH V4 5/5] vdpasim: vDPA device simulator
From: Jason Wang <jasowang@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200220061141.29390-1-jasowang@redhat.com>
 <20200220061141.29390-6-jasowang@redhat.com>
 <20200220151215.GU23930@mellanox.com>
 <6c341a77-a297-b7c7-dea5-b3f7b920b1f3@redhat.com>
Message-ID: <793a1b81-4f78-c405-4aae-f32a2bf67d87@redhat.com>
Date: Wed, 26 Feb 2020 14:12:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6c341a77-a297-b7c7-dea5-b3f7b920b1f3@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>, "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 Shahaf Shuler <shahafs@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
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

Ck9uIDIwMjAvMi8yMSDkuIvljYgzOjU3LCBKYXNvbiBXYW5nIHdyb3RlOgo+Cj4gT24gMjAyMC8y
LzIwIOS4i+WNiDExOjEyLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4+IE9uIFRodSwgRmViIDIw
LCAyMDIwIGF0IDAyOjExOjQxUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+PiArc3RhdGlj
IHZvaWQgdmRwYXNpbV9kZXZpY2VfcmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+PiArewo+
Pj4gK8KgwqDCoCBzdHJ1Y3QgdmRwYXNpbSAqdmRwYXNpbSA9IGRldl90b19zaW0oZGV2KTsKPj4+
ICsKPj4+ICvCoMKgwqAgY2FuY2VsX3dvcmtfc3luYygmdmRwYXNpbS0+d29yayk7Cj4+PiArwqDC
oMKgIGtmcmVlKHZkcGFzaW0tPmJ1ZmZlcik7Cj4+PiArwqDCoMKgIHZob3N0X2lvdGxiX2ZyZWUo
dmRwYXNpbS0+aW9tbXUpOwo+Pj4gK8KgwqDCoCBrZnJlZSh2ZHBhc2ltKTsKPj4+ICt9Cj4+PiAr
Cj4+PiArc3RhdGljIHN0cnVjdCB2ZHBhc2ltICp2ZHBhc2ltX2NyZWF0ZSh2b2lkKQo+Pj4gK3sK
Pj4+ICvCoMKgwqAgc3RydWN0IHZpcnRpb19uZXRfY29uZmlnICpjb25maWc7Cj4+PiArwqDCoMKg
IHN0cnVjdCB2aG9zdF9pb3RsYiAqaW9tbXU7Cj4+PiArwqDCoMKgIHN0cnVjdCB2ZHBhc2ltICp2
ZHBhc2ltOwo+Pj4gK8KgwqDCoCBzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4+PiArwqDCoMKgIHZvaWQg
KmJ1ZmZlcjsKPj4+ICvCoMKgwqAgaW50IHJldCA9IC1FTk9NRU07Cj4+PiArCj4+PiArwqDCoMKg
IGlvbW11ID0gdmhvc3RfaW90bGJfYWxsb2MoMjA0OCwgMCk7Cj4+PiArwqDCoMKgIGlmICghaW9t
bXUpCj4+PiArwqDCoMKgwqDCoMKgwqAgZ290byBlcnI7Cj4+PiArCj4+PiArwqDCoMKgIGJ1ZmZl
ciA9IGttYWxsb2MoUEFHRV9TSVpFLCBHRlBfS0VSTkVMKTsKPj4+ICvCoMKgwqAgaWYgKCFidWZm
ZXIpCj4+PiArwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfYnVmZmVyOwo+Pj4gKwo+Pj4gK8KgwqDC
oCB2ZHBhc2ltID0ga3phbGxvYyhzaXplb2YoKnZkcGFzaW0pLCBHRlBfS0VSTkVMKTsKPj4+ICvC
oMKgwqAgaWYgKCF2ZHBhc2ltKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX2FsbG9jOwo+
Pj4gKwo+Pj4gK8KgwqDCoCB2ZHBhc2ltLT5idWZmZXIgPSBidWZmZXI7Cj4+PiArwqDCoMKgIHZk
cGFzaW0tPmlvbW11ID0gaW9tbXU7Cj4+PiArCj4+PiArwqDCoMKgIGNvbmZpZyA9ICZ2ZHBhc2lt
LT5jb25maWc7Cj4+PiArwqDCoMKgIGNvbmZpZy0+bXR1ID0gMTUwMDsKPj4+ICvCoMKgwqAgY29u
ZmlnLT5zdGF0dXMgPSBWSVJUSU9fTkVUX1NfTElOS19VUDsKPj4+ICvCoMKgwqAgZXRoX3JhbmRv
bV9hZGRyKGNvbmZpZy0+bWFjKTsKPj4+ICsKPj4+ICvCoMKgwqAgSU5JVF9XT1JLKCZ2ZHBhc2lt
LT53b3JrLCB2ZHBhc2ltX3dvcmspOwo+Pj4gK8KgwqDCoCBzcGluX2xvY2tfaW5pdCgmdmRwYXNp
bS0+bG9jayk7Cj4+PiArCj4+PiArwqDCoMKgIHZyaW5naF9zZXRfaW90bGIoJnZkcGFzaW0tPnZx
c1swXS52cmluZywgdmRwYXNpbS0+aW9tbXUpOwo+Pj4gK8KgwqDCoCB2cmluZ2hfc2V0X2lvdGxi
KCZ2ZHBhc2ltLT52cXNbMV0udnJpbmcsIHZkcGFzaW0tPmlvbW11KTsKPj4+ICsKPj4+ICvCoMKg
wqAgZGV2ID0gJnZkcGFzaW0tPmRldjsKPj4+ICvCoMKgwqAgZGV2LT5yZWxlYXNlID0gdmRwYXNp
bV9kZXZpY2VfcmVsZWFzZTsKPj4+ICvCoMKgwqAgZGV2LT5jb2hlcmVudF9kbWFfbWFzayA9IERN
QV9CSVRfTUFTSyg2NCk7Cj4+PiArwqDCoMKgIHNldF9kbWFfb3BzKGRldiwgJnZkcGFzaW1fZG1h
X29wcyk7Cj4+PiArwqDCoMKgIGRldl9zZXRfbmFtZShkZXYsICIlcyIsIFZEUEFTSU1fTkFNRSk7
Cj4+PiArCj4+PiArwqDCoMKgIHJldCA9IGRldmljZV9yZWdpc3RlcigmdmRwYXNpbS0+ZGV2KTsK
Pj4+ICvCoMKgwqAgaWYgKHJldCkKPj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9pbml0Owo+
PiBJdCBpcyBhIGJpdCB3ZWlyZCB0byBiZSBjcmVhdGluZyB0aGlzIGR1bW15IHBhcmVudCwgY291
bGRuJ3QgdGhpcyBiZQo+PiBkb25lIGJ5IGp1c3QgcGFzc2luZyBhIE5VTEwgcGFyZW50IHRvIHZk
cGFfYWxsb2NfZGV2aWNlLCBkb2luZwo+PiBzZXRfZG1hX29wcygpIG9uIHRoZSB2ZHBhc2ltLT52
ZHBhLT5kZXYgYW5kIHNldHRpbmcgZG1hX2RldmljZSB0bwo+PiB2ZHBhc2ltLT52ZHBhLT5kZXYg
Pwo+Cj4KPiBJIHRoaW5rIGl0IHdvcmtzLgoKClJldGhpbmsgYWJvdXQgdGhpcywgc2luY2UgbW9z
dCBoYXJkd2FyZSB2RFBBIGRyaXZlciB3aWxsIGhhdmUgYSBwYXJlbnQgCmFuZCB3aWxsIHVzZSBp
dCB0byBmaW5kIHRoZSBwYXJlbnQgc3RydWN0dXJlIGUuZwoKZGV2X2dldF9kcnZkYXRhKHZkcGEt
PmRldi0+cGFyZW50KQoKU28gSSBrZWVwIHRoaXMgZHVtbXkgcGFyZW50IGluIFY1LgoKVGhhbmtz
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
