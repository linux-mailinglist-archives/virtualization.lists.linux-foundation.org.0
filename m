Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EED21672CF
	for <lists.virtualization@lfdr.de>; Fri, 21 Feb 2020 09:06:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EA59F86E2A;
	Fri, 21 Feb 2020 08:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rh+UavC9OiXp; Fri, 21 Feb 2020 08:06:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2AE0F86DDC;
	Fri, 21 Feb 2020 08:06:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA460C013E;
	Fri, 21 Feb 2020 08:06:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7185CC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 08:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 601BD1FE2F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 08:06:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fIhMxE55Ivkj
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 08:06:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 3CA8D20131
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 08:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582272408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nZPMKkDRpIygusMljWBR/rOUYIWd4dKR+JmAgMAgsbA=;
 b=Z2GvPJvRkWsfuiiAD27KB6TojxSjhRQp9S9Av5hbeOWTA4eru/Ntys8T8U3ZjjGUVGKFyo
 LK4BLomJMkfe1UkZOHpR15hsVBTaTZVlHPXsg0kARuVsP4OXebVj1B5visGXu4zEsUj1Hb
 3Lks0tO/7IUluBqN0C2ELNogBuAfwuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-db6s2tGWP_mUlg7iG2WDtg-1; Fri, 21 Feb 2020 03:06:47 -0500
X-MC-Unique: db6s2tGWP_mUlg7iG2WDtg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 247D0107ACCA;
 Fri, 21 Feb 2020 08:06:44 +0000 (UTC)
Received: from [10.72.13.208] (ovpn-13-208.pek2.redhat.com [10.72.13.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A64978B740;
 Fri, 21 Feb 2020 08:06:25 +0000 (UTC)
Subject: Re: [PATCH V4 4/5] virtio: introduce a vDPA based transport
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200220061141.29390-1-jasowang@redhat.com>
 <20200220061141.29390-5-jasowang@redhat.com>
 <20200220151914.GW23930@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d6d910bb-8431-7e95-8808-9ed2d6ec9211@redhat.com>
Date: Fri, 21 Feb 2020 16:06:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200220151914.GW23930@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Ck9uIDIwMjAvMi8yMCDkuIvljYgxMToxOSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFRo
dSwgRmViIDIwLCAyMDIwIGF0IDAyOjExOjQwUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+
ICtzdGF0aWMgaW50IHZpcnRpb192ZHBhX3Byb2JlKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYSkK
Pj4gK3sKPj4gKwljb25zdCBzdHJ1Y3QgdmRwYV9jb25maWdfb3BzICpvcHMgPSB2ZHBhLT5jb25m
aWc7Cj4+ICsJc3RydWN0IHZpcnRpb192ZHBhX2RldmljZSAqdmRfZGV2Owo+PiArCWludCByZXQg
PSAtRUlOVkFMOwo+PiArCj4+ICsJdmRfZGV2ID0ga3phbGxvYyhzaXplb2YoKnZkX2RldiksIEdG
UF9LRVJORUwpOwo+PiArCWlmICghdmRfZGV2KQo+PiArCQlyZXR1cm4gLUVOT01FTTsKPj4gKwo+
PiArCXZkX2Rldi0+dmRldi5kZXYucGFyZW50ID0gdmRwYV9nZXRfZG1hX2Rldih2ZHBhKTsKPj4g
Kwl2ZF9kZXYtPnZkZXYuZGV2LnJlbGVhc2UgPSB2aXJ0aW9fdmRwYV9yZWxlYXNlX2RldjsKPj4g
Kwl2ZF9kZXYtPnZkZXYuY29uZmlnID0gJnZpcnRpb192ZHBhX2NvbmZpZ19vcHM7Cj4+ICsJdmRf
ZGV2LT52ZHBhID0gdmRwYTsKPj4gKwlJTklUX0xJU1RfSEVBRCgmdmRfZGV2LT52aXJ0cXVldWVz
KTsKPj4gKwlzcGluX2xvY2tfaW5pdCgmdmRfZGV2LT5sb2NrKTsKPj4gKwo+PiArCXZkX2Rldi0+
dmRldi5pZC5kZXZpY2UgPSBvcHMtPmdldF9kZXZpY2VfaWQodmRwYSk7Cj4+ICsJaWYgKHZkX2Rl
di0+dmRldi5pZC5kZXZpY2UgPT0gMCkKPj4gKwkJZ290byBlcnI7Cj4+ICsKPj4gKwl2ZF9kZXYt
PnZkZXYuaWQudmVuZG9yID0gb3BzLT5nZXRfdmVuZG9yX2lkKHZkcGEpOwo+PiArCXJldCA9IHJl
Z2lzdGVyX3ZpcnRpb19kZXZpY2UoJnZkX2Rldi0+dmRldik7Cj4+ICsJaWYgKHJldCkKPj4gKwkJ
Z290byBlcnI7Cj4gVGhpcyBlcnJvciB1bndpbmQgaXMgd3JvbmcuIHJlZ2lzdGVyX3ZpcnRpb19k
ZXZpY2UoKSBkb2VzCj4gZGV2aWNlX2luaXRpYWxpemUoKSBhcyBpdCdzIGZpcnN0IGFjdGlvbi4g
QWZ0ZXIgdGhhdCBwb2ludCBlcnJvcgo+IHVud2luZCBtdXN0IGJlIGRvbmUgd2l0aCBwdXRfZGV2
aWNlKCkgLSBwYXJ0aWN1bGFybHkgY2FsbGluZwo+IGtmcmVlKHZkX2RldikgYWZ0ZXIgZG9pbmcg
ZGV2X3NldF9uYW1lKCkgbGVha3MgbWVtb3J5LgoKCkV4YWN0bHkuCgoKPgo+IExvb2tzIGxpa2Ug
YWJvdXQgaGFsZiBvZiB0aGUgcmVnaXN0ZXJfdmlydGlvX2RldmljZSgpIHVzZXJzIGRpZCB0aGlz
Cj4gcmlnaHQsIHRoZSBvdGhlcnMgbm90LiBQZXJoYXBzIHlvdSBzaG91bGQgZml4IHRoZW0gdG9v
Li4uCj4KPiBKYXNvbgoKCldpbGwgZG8uCgpUaGFua3MKCgo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
