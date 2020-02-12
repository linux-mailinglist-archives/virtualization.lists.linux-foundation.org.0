Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8822715A279
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 08:56:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3764986497;
	Wed, 12 Feb 2020 07:55:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xsENBS1EtTF2; Wed, 12 Feb 2020 07:55:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7DAAF864E0;
	Wed, 12 Feb 2020 07:55:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D10CC0177;
	Wed, 12 Feb 2020 07:55:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 849ADC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 07:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6D4DB87A9C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 07:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t6eJhepjna3Z
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 07:55:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B0C7187A30
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 07:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581494153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6lJXyrbl6ehIPLDhdvGx94ceUYOxEq2wFztlRa5WwwQ=;
 b=a65sjySZfWE+uFTgwGTt3UWRH2xxIujiFDkmxzFSJzifUokUXoRzDODK7IaBqwxoOK76UU
 u8cMXcAaIkgK9l36CJ2VtsyIxobwpk604y5E8a6RpSshdS70UNGcE6nNGC09XClbOn5Lfy
 Fu50NaZfmgyrS6/7hZ8cn8V58eDW0FE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-Ai4LYDoyOY2q3q5g_r5Iww-1; Wed, 12 Feb 2020 02:55:51 -0500
X-MC-Unique: Ai4LYDoyOY2q3q5g_r5Iww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CB10107ACC9;
 Wed, 12 Feb 2020 07:55:49 +0000 (UTC)
Received: from [10.72.13.111] (ovpn-13-111.pek2.redhat.com [10.72.13.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29C5960BF1;
 Wed, 12 Feb 2020 07:55:32 +0000 (UTC)
Subject: Re: [PATCH V2 3/5] vDPA: introduce vDPA bus
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200210035608.10002-1-jasowang@redhat.com>
 <20200210035608.10002-4-jasowang@redhat.com>
 <20200211134746.GI4271@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cf7abcc9-f8ef-1fe2-248e-9b9028788ade@redhat.com>
Date: Wed, 12 Feb 2020 15:55:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200211134746.GI4271@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: kvm@vger.kernel.org, mst@redhat.com, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 lulu@redhat.com, hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com,
 haotian.wang@sifive.com, shahafs@mellanox.com, parav@mellanox.com,
 jiri@mellanox.com, xiao.w.wang@intel.com, stefanha@redhat.com,
 zhihong.wang@intel.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
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

Ck9uIDIwMjAvMi8xMSDkuIvljYg5OjQ3LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gTW9u
LCBGZWIgMTAsIDIwMjAgYXQgMTE6NTY6MDZBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4g
Ky8qKgo+PiArICogdmRwYV9yZWdpc3Rlcl9kZXZpY2UgLSByZWdpc3RlciBhIHZEUEEgZGV2aWNl
Cj4+ICsgKiBDYWxsZXJzIG11c3QgaGF2ZSBhIHN1Y2NlZWQgY2FsbCBvZiB2ZHBhX2luaXRfZGV2
aWNlKCkgYmVmb3JlLgo+PiArICogQHZkZXY6IHRoZSB2ZHBhIGRldmljZSB0byBiZSByZWdpc3Rl
cmVkIHRvIHZEUEEgYnVzCj4+ICsgKgo+PiArICogUmV0dXJucyBhbiBlcnJvciB3aGVuIGZhaWwg
dG8gYWRkIHRvIHZEUEEgYnVzCj4+ICsgKi8KPj4gK2ludCB2ZHBhX3JlZ2lzdGVyX2RldmljZShz
dHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYpCj4+ICt7Cj4+ICsJaW50IGVyciA9IGRldmljZV9hZGQo
JnZkZXYtPmRldik7Cj4+ICsKPj4gKwlpZiAoZXJyKSB7Cj4+ICsJCXB1dF9kZXZpY2UoJnZkZXYt
PmRldik7Cj4+ICsJCWlkYV9zaW1wbGVfcmVtb3ZlKCZ2ZHBhX2luZGV4X2lkYSwgdmRldi0+aW5k
ZXgpOwo+PiArCX0KPiBUaGlzIGlzIGEgdmVyeSBkYW5nZXJvdXMgY29uc3RydWN0aW9uLCBJJ3Zl
IHNlZW4gaXQgbGVhZCB0byBkcml2ZXIKPiBidWdzLiBCZXR0ZXIgdG8gcmVxdWlyZSB0aGUgZHJp
dmVyIHRvIGFsd2F5cyBkbyB0aGUgcHV0X2RldmljZSBvbgo+IGVycm9yIHVud2luZAoKCk9rLgoK
Cj4KPiBUaGUgaWRhX3NpbXBsZV9yZW1vdmUgc2hvdWxkIHByb2JhYmx5IGJlIHBhcnQgb2YgdGhl
IGNsYXNzIHJlbGVhc2UKPiBmdW5jdGlvbiB0byBtYWtlIGV2ZXJ5dGhpbmcgd29yayByaWdodAoK
Ckl0IGxvb2tzIHRvIG1lIGJ1cyBpbnN0ZWFkIG9mIGNsYXNzIGlzIHRoZSBjb3JyZWN0IGFic3Ry
YWN0aW9uIGhlcmUgCnNpbmNlIHRoZSBkZXZpY2VzIHNoYXJlIGEgc2V0IG9mIHByb2dyYW1taW5n
IGludGVyZmFjZSBidXQgbm90IHRoZSAKc2VtYW50aWNzLgoKT3IgZG8geW91IGFjdHVhbGx5IG1l
YW4gdHlwZSBoZXJlPwoKCj4KPj4gKy8qKgo+PiArICogdmRwYV91bnJlZ2lzdGVyX2RyaXZlciAt
IHVucmVnaXN0ZXIgYSB2RFBBIGRldmljZSBkcml2ZXIKPj4gKyAqIEBkcnY6IHRoZSB2ZHBhIGRl
dmljZSBkcml2ZXIgdG8gYmUgdW5yZWdpc3RlcmVkCj4+ICsgKi8KPj4gK3ZvaWQgdmRwYV91bnJl
Z2lzdGVyX2RyaXZlcihzdHJ1Y3QgdmRwYV9kcml2ZXIgKmRydikKPj4gK3sKPj4gKwlkcml2ZXJf
dW5yZWdpc3RlcigmZHJ2LT5kcml2ZXIpOwo+PiArfQo+PiArRVhQT1JUX1NZTUJPTF9HUEwodmRw
YV91bnJlZ2lzdGVyX2RyaXZlcik7Cj4+ICsKPj4gK3N0YXRpYyBpbnQgdmRwYV9pbml0KHZvaWQp
Cj4+ICt7Cj4+ICsJaWYgKGJ1c19yZWdpc3RlcigmdmRwYV9idXMpICE9IDApCj4+ICsJCXBhbmlj
KCJ2aXJ0aW8gYnVzIHJlZ2lzdHJhdGlvbiBmYWlsZWQiKTsKPj4gKwlyZXR1cm4gMDsKPj4gK30K
PiBMaW51cyB3aWxsIHRlbGwgeW91IG5vdCB0byBraWxsIHRoZSBrZXJuZWwgLSByZXR1cm4gdGhl
IGVycm9yIGNvZGUgYW5kCj4gcHJvcGFnYXRlIGl0IHVwIHRvIHRoZSBtb2R1bGUgaW5pdCBmdW5j
dGlvbi4KCgpZZXMsIHdpbGwgZml4LgoKCj4KPj4gKy8qKgo+PiArICogdkRQQSBkZXZpY2UgLSBy
ZXByZXNlbnRhdGlvbiBvZiBhIHZEUEEgZGV2aWNlCj4+ICsgKiBAZGV2OiB1bmRlcmx5aW5nIGRl
dmljZQo+PiArICogQGRtYV9kZXY6IHRoZSBhY3R1YWwgZGV2aWNlIHRoYXQgaXMgcGVyZm9ybWlu
ZyBETUEKPj4gKyAqIEBjb25maWc6IHRoZSBjb25maWd1cmF0aW9uIG9wcyBmb3IgdGhpcyBkZXZp
Y2UuCj4+ICsgKiBAaW5kZXg6IGRldmljZSBpbmRleAo+PiArICovCj4+ICtzdHJ1Y3QgdmRwYV9k
ZXZpY2Ugewo+PiArCXN0cnVjdCBkZXZpY2UgZGV2Owo+PiArCXN0cnVjdCBkZXZpY2UgKmRtYV9k
ZXY7Cj4+ICsJY29uc3Qgc3RydWN0IHZkcGFfY29uZmlnX29wcyAqY29uZmlnOwo+PiArCWludCBp
bmRleDsKPiB1bnNpZ25lZCB2YWx1ZXMgc2h1bGQgYmUgdW5zaWduZWQgaW50Cj4KPiBKYXNvbgoK
CldpbGwgZml4LgoKVGhhbmtzCgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25A
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
