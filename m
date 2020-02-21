Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D57B1671DA
	for <lists.virtualization@lfdr.de>; Fri, 21 Feb 2020 08:57:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C334B86EB2;
	Fri, 21 Feb 2020 07:57:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ticJgVpceftn; Fri, 21 Feb 2020 07:57:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1D3EA86ED5;
	Fri, 21 Feb 2020 07:57:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE645C1D81;
	Fri, 21 Feb 2020 07:57:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 959AEC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 07:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 613CF2041D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 07:57:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a4qelFdgnwwz
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 07:57:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 5C8AC20131
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 07:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582271872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qZ2vYX6aTEtYA+Rmtsl2PSnzUra/4wEX+6A+xs3OWnE=;
 b=fICJukfYhcyMyFkOqBlQi6nnMvVXDkasO/fHBO4MvkX33xhY7jiPQbioiDX7/DQktAMZVy
 L3sFBD3s/TTKuZ0NtGge89eKIL1o8fV1jQFNHw9YxruLPMQ/aQq6TnmWn5smQgWkbnxd9B
 zU6S0yr0b6bUzkhn3IntLZjHwUlHZ/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-s328FKtIP_GiYZgic4bVwg-1; Fri, 21 Feb 2020 02:57:50 -0500
X-MC-Unique: s328FKtIP_GiYZgic4bVwg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89523107ACC5;
 Fri, 21 Feb 2020 07:57:47 +0000 (UTC)
Received: from [10.72.13.208] (ovpn-13-208.pek2.redhat.com [10.72.13.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A094B8ECFD;
 Fri, 21 Feb 2020 07:57:31 +0000 (UTC)
Subject: Re: [PATCH V4 5/5] vdpasim: vDPA device simulator
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200220061141.29390-1-jasowang@redhat.com>
 <20200220061141.29390-6-jasowang@redhat.com>
 <20200220151215.GU23930@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6c341a77-a297-b7c7-dea5-b3f7b920b1f3@redhat.com>
Date: Fri, 21 Feb 2020 15:57:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200220151215.GU23930@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Ck9uIDIwMjAvMi8yMCDkuIvljYgxMToxMiwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFRo
dSwgRmViIDIwLCAyMDIwIGF0IDAyOjExOjQxUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+
ICtzdGF0aWMgdm9pZCB2ZHBhc2ltX2RldmljZV9yZWxlYXNlKHN0cnVjdCBkZXZpY2UgKmRldikK
Pj4gK3sKPj4gKwlzdHJ1Y3QgdmRwYXNpbSAqdmRwYXNpbSA9IGRldl90b19zaW0oZGV2KTsKPj4g
Kwo+PiArCWNhbmNlbF93b3JrX3N5bmMoJnZkcGFzaW0tPndvcmspOwo+PiArCWtmcmVlKHZkcGFz
aW0tPmJ1ZmZlcik7Cj4+ICsJdmhvc3RfaW90bGJfZnJlZSh2ZHBhc2ltLT5pb21tdSk7Cj4+ICsJ
a2ZyZWUodmRwYXNpbSk7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBzdHJ1Y3QgdmRwYXNpbSAqdmRw
YXNpbV9jcmVhdGUodm9pZCkKPj4gK3sKPj4gKwlzdHJ1Y3QgdmlydGlvX25ldF9jb25maWcgKmNv
bmZpZzsKPj4gKwlzdHJ1Y3Qgdmhvc3RfaW90bGIgKmlvbW11Owo+PiArCXN0cnVjdCB2ZHBhc2lt
ICp2ZHBhc2ltOwo+PiArCXN0cnVjdCBkZXZpY2UgKmRldjsKPj4gKwl2b2lkICpidWZmZXI7Cj4+
ICsJaW50IHJldCA9IC1FTk9NRU07Cj4+ICsKPj4gKwlpb21tdSA9IHZob3N0X2lvdGxiX2FsbG9j
KDIwNDgsIDApOwo+PiArCWlmICghaW9tbXUpCj4+ICsJCWdvdG8gZXJyOwo+PiArCj4+ICsJYnVm
ZmVyID0ga21hbGxvYyhQQUdFX1NJWkUsIEdGUF9LRVJORUwpOwo+PiArCWlmICghYnVmZmVyKQo+
PiArCQlnb3RvIGVycl9idWZmZXI7Cj4+ICsKPj4gKwl2ZHBhc2ltID0ga3phbGxvYyhzaXplb2Yo
KnZkcGFzaW0pLCBHRlBfS0VSTkVMKTsKPj4gKwlpZiAoIXZkcGFzaW0pCj4+ICsJCWdvdG8gZXJy
X2FsbG9jOwo+PiArCj4+ICsJdmRwYXNpbS0+YnVmZmVyID0gYnVmZmVyOwo+PiArCXZkcGFzaW0t
PmlvbW11ID0gaW9tbXU7Cj4+ICsKPj4gKwljb25maWcgPSAmdmRwYXNpbS0+Y29uZmlnOwo+PiAr
CWNvbmZpZy0+bXR1ID0gMTUwMDsKPj4gKwljb25maWctPnN0YXR1cyA9IFZJUlRJT19ORVRfU19M
SU5LX1VQOwo+PiArCWV0aF9yYW5kb21fYWRkcihjb25maWctPm1hYyk7Cj4+ICsKPj4gKwlJTklU
X1dPUksoJnZkcGFzaW0tPndvcmssIHZkcGFzaW1fd29yayk7Cj4+ICsJc3Bpbl9sb2NrX2luaXQo
JnZkcGFzaW0tPmxvY2spOwo+PiArCj4+ICsJdnJpbmdoX3NldF9pb3RsYigmdmRwYXNpbS0+dnFz
WzBdLnZyaW5nLCB2ZHBhc2ltLT5pb21tdSk7Cj4+ICsJdnJpbmdoX3NldF9pb3RsYigmdmRwYXNp
bS0+dnFzWzFdLnZyaW5nLCB2ZHBhc2ltLT5pb21tdSk7Cj4+ICsKPj4gKwlkZXYgPSAmdmRwYXNp
bS0+ZGV2Owo+PiArCWRldi0+cmVsZWFzZSA9IHZkcGFzaW1fZGV2aWNlX3JlbGVhc2U7Cj4+ICsJ
ZGV2LT5jb2hlcmVudF9kbWFfbWFzayA9IERNQV9CSVRfTUFTSyg2NCk7Cj4+ICsJc2V0X2RtYV9v
cHMoZGV2LCAmdmRwYXNpbV9kbWFfb3BzKTsKPj4gKwlkZXZfc2V0X25hbWUoZGV2LCAiJXMiLCBW
RFBBU0lNX05BTUUpOwo+PiArCj4+ICsJcmV0ID0gZGV2aWNlX3JlZ2lzdGVyKCZ2ZHBhc2ltLT5k
ZXYpOwo+PiArCWlmIChyZXQpCj4+ICsJCWdvdG8gZXJyX2luaXQ7Cj4gSXQgaXMgYSBiaXQgd2Vp
cmQgdG8gYmUgY3JlYXRpbmcgdGhpcyBkdW1teSBwYXJlbnQsIGNvdWxkbid0IHRoaXMgYmUKPiBk
b25lIGJ5IGp1c3QgcGFzc2luZyBhIE5VTEwgcGFyZW50IHRvIHZkcGFfYWxsb2NfZGV2aWNlLCBk
b2luZwo+IHNldF9kbWFfb3BzKCkgb24gdGhlIHZkcGFzaW0tPnZkcGEtPmRldiBhbmQgc2V0dGlu
ZyBkbWFfZGV2aWNlIHRvCj4gdmRwYXNpbS0+dmRwYS0+ZGV2ID8KCgpJIHRoaW5rIGl0IHdvcmtz
LgoKCj4+ICsJdmRwYXNpbS0+dmRwYSA9IHZkcGFfYWxsb2NfZGV2aWNlKGRldiwgZGV2LCAmdmRw
YXNpbV9uZXRfY29uZmlnX29wcyk7Cj4+ICsJaWYgKHJldCkKPj4gKwkJZ290byBlcnJfdmRwYTsK
Pj4gKwlyZXQgPSB2ZHBhX3JlZ2lzdGVyX2RldmljZSh2ZHBhc2ltLT52ZHBhKTsKPj4gKwlpZiAo
cmV0KQo+PiArCQlnb3RvIGVycl9yZWdpc3RlcjsKPj4gKwo+PiArCXJldHVybiB2ZHBhc2ltOwo+
PiArCj4+ICtlcnJfcmVnaXN0ZXI6Cj4+ICsJcHV0X2RldmljZSgmdmRwYXNpbS0+dmRwYS0+ZGV2
KTsKPj4gK2Vycl92ZHBhOgo+PiArCWRldmljZV9kZWwoJnZkcGFzaW0tPmRldik7Cj4+ICsJZ290
byBlcnI7Cj4+ICtlcnJfaW5pdDoKPj4gKwlwdXRfZGV2aWNlKCZ2ZHBhc2ltLT5kZXYpOwo+PiAr
CWdvdG8gZXJyOwo+IElmIHlvdSBkbyB0aGUgdmRtYXNpbSBhbGxvYyBmaXJzdCwgYW5kIGltbWVk
aWF0ZWx5IGRvCj4gZGV2aWNlX2luaXRpYWxpemUoKSB0aGVuIGFsbCB0aGUgZmFpbHVyZSBwYXRo
cyBjYW4gZG8gcHV0X2RldmljZQo+IGluc3RlYWQgb2YgaGF2aW5nIHRoaXMgdWdseSBnb3RvIHVu
d2luZCBzcGxpdC4gSnVzdCBjaGVjayBmb3IKPiB2ZHBhc2ltLT5pb21tdSA9PSBOVUxMIGR1cmlu
ZyByZWxlYXNlLgoKClllcywgdGhhdCBsb29rcyBzaW1wbGVyLgoKCj4KPj4gK3N0YXRpYyBpbnQg
X19pbml0IHZkcGFzaW1fZGV2X2luaXQodm9pZCkKPj4gK3sKPj4gKwl2ZHBhc2ltX2RldiA9IHZk
cGFzaW1fY3JlYXRlKCk7Cj4+ICsKPj4gKwlpZiAoIUlTX0VSUih2ZHBhc2ltX2RldikpCj4+ICsJ
CXJldHVybiAwOwo+PiArCj4+ICsJcmV0dXJuIFBUUl9FUlIodmRwYXNpbV9kZXYpOwo+PiArfQo+
PiArCj4+ICtzdGF0aWMgaW50IHZkcGFzaW1fZGV2aWNlX3JlbW92ZV9jYihzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHZvaWQgKmRhdGEpCj4+ICt7Cj4+ICsJc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhID0g
ZGV2X3RvX3ZkcGEoZGV2KTsKPj4gKwo+PiArCXZkcGFfdW5yZWdpc3Rlcl9kZXZpY2UodmRwYSk7
Cj4+ICsKPj4gKwlyZXR1cm4gMDsKPj4gK30KPj4gKwo+PiArc3RhdGljIHZvaWQgX19leGl0IHZk
cGFzaW1fZGV2X2V4aXQodm9pZCkKPj4gK3sKPj4gKwlkZXZpY2VfZm9yX2VhY2hfY2hpbGQoJnZk
cGFzaW1fZGV2LT5kZXYsIE5VTEwsCj4+ICsJCQkgICAgICB2ZHBhc2ltX2RldmljZV9yZW1vdmVf
Y2IpOwo+IFdoeSB0aGUgbG9vcD8gVGhlcmUgaXMgb25seSBvbmUgZGV2aWNlLCBhbmQgaXQgaXMg
aW4gdGhlIGdsb2JhbAo+IHZhcmFpYmxlIHZkbWFzaW1fZGV2ID8KCgpOb3QgbmVjZXNzYXJ5IGJ1
dCBkb2Vzbid0IGhhcm0sIHdpbGwgcmVtb3ZlIHRoaXMuCgpUaGFua3MKCgo+Cj4gSmFzb24KPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
