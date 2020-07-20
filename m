Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 238F122566B
	for <lists.virtualization@lfdr.de>; Mon, 20 Jul 2020 06:12:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9528886AFE;
	Mon, 20 Jul 2020 04:12:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8RvHc351Ps6K; Mon, 20 Jul 2020 04:12:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BC7EA86AFD;
	Mon, 20 Jul 2020 04:12:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 905A6C016F;
	Mon, 20 Jul 2020 04:12:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCE1AC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 04:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C24EA86AFD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 04:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZQwD4+X4rB1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 04:12:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C44B486A4D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 04:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595218361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jNmYyatHBjazXta2G+8f7FUFOpNtqCLp5w3UofyHTXI=;
 b=NhGyvHJbQMo/M9hKb5pOldAv5Vw5sUN6F5b3jfvbGMt5RcODI28+As17tXGQauTm+lqO/+
 W1eQnDLkUvkuoe9PFXa2hivR/rX8srpOXjh6Ey9ynd1JCnZtOaVNM/JYYCIhgB9HXeRqIf
 o5Nz5paJrGZn4+eY5/tg//hADOfNqdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-vz456LNhO_qCuug1rjUAMQ-1; Mon, 20 Jul 2020 00:12:39 -0400
X-MC-Unique: vz456LNhO_qCuug1rjUAMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D803318A1DE1;
 Mon, 20 Jul 2020 04:12:37 +0000 (UTC)
Received: from [10.72.13.139] (ovpn-13-139.pek2.redhat.com [10.72.13.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69EAA72E52;
 Mon, 20 Jul 2020 04:12:32 +0000 (UTC)
Subject: Re: [PATCH vhost next 10/10] vdpa/mlx5: Add VDPA driver for supported
 mlx5 devices
To: Eli Cohen <eli@mellanox.com>
References: <20200716072327.5359-1-eli@mellanox.com>
 <20200716072327.5359-11-eli@mellanox.com>
 <454850cc-269b-72aa-4511-2bf793a215cc@redhat.com>
 <20200716115428.GC186790@mtl-vdi-166.wap.labs.mlnx>
 <b85ecb97-2120-f63f-f5f4-01d90f88d666@redhat.com>
 <20200718194902.GA52765@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ed10cb66-174f-ec5c-8043-4e18de65fb99@redhat.com>
Date: Mon, 20 Jul 2020 12:12:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200718194902.GA52765@mtl-vdi-166.wap.labs.mlnx>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: shahafs@mellanox.com, Parav Pandit <parav@mellanox.com>, mst@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 saeedm@mellanox.com, Eugenio Perez Martin <eperezma@redhat.com>
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

Ck9uIDIwMjAvNy8xOSDkuIrljYgzOjQ5LCBFbGkgQ29oZW4gd3JvdGU6Cj4gT24gRnJpLCBKdWwg
MTcsIDIwMjAgYXQgMDQ6NTc6MjlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+IExvb2tz
IGxpa2UgY2hlY2tpbmcgaW50aWFsaXplZCBpcyBlbm91Z2guIFdpbGwgZml4IHRoaXMuCj4+Pj4+
ICsKPj4+Pj4gK3N0YXRpYyB2b2lkIG1seDVfdmRwYV9zZXRfdnFfcmVhZHkoc3RydWN0IHZkcGFf
ZGV2aWNlICp2ZGV2LCB1MTYgaWR4LCBib29sIHJlYWR5KQo+Pj4+PiArewo+Pj4+PiArCXN0cnVj
dCBtbHg1X3ZkcGFfZGV2ICptdmRldiA9IHRvX212ZGV2KHZkZXYpOwo+Pj4+PiArCXN0cnVjdCBt
bHg1X3ZkcGFfbmV0ICpuZGV2ID0gdG9fbWx4NV92ZHBhX25kZXYobXZkZXYpOwo+Pj4+PiArCXN0
cnVjdCBtbHg1X3ZkcGFfdmlydHF1ZXVlICptdnEgPSAmbmRldi0+dnFzW2lkeF07Cj4+Pj4+ICsJ
aW50IGVycjsKPj4+Pj4gKwo+Pj4+PiArCWlmICghbXZxLT5yZWFkeSAmJiByZWFkeSAmJiBtdnEt
PmZ3X3N0YXRlICE9IE1MWDVfVklSVElPX05FVF9RX09CSkVDVF9TVEFURV9SRFkpIHsKPj4+Pj4g
KwkJZXJyID0gbW9kaWZ5X3ZpcnRxdWV1ZShuZGV2LCBtdnEsIE1MWDVfVklSVElPX05FVF9RX09C
SkVDVF9TVEFURV9SRFkpOwo+Pj4+PiArCQlpZiAoZXJyKSB7Cj4+Pj4+ICsJCQltbHg1X3ZkcGFf
d2FybihtdmRldiwgImZhaWxlZCB0byBtb2RpZnkgdmlydHF1ZXVlKCVkKVxuIiwgZXJyKTsKPj4+
Pj4gKwkJCXJldHVybjsKPj4+Pj4gKwkJfQo+Pj4+PiArCX0KPj4+PiBJIHdvbmRlciB3aGF0J3Mg
dGhlIHJlYXNvbiBvZiBjaGFuZ2luZyB2cSBzdGF0ZSBvbiB0aGUgaGFyZHdhcmUKPj4+PiBoZXJl
LiBJIHRoaW5rIHdlIGNhbiBkZWZlciBpdCB0byBzZXRfc3RhdHVzKCkuCj4+Pj4KPj4+IEkgY2Fu
IGRlZmVyIHRoaXMgdG8gc2V0IHN0YXR1cy4KPj4+Cj4+PiBJIGp1c3Qgd29uZGVyIGlmIGl0IGlz
IHBvc3NpYmxlIHRoYXQgdGhlIGNvcmUgdmRwYSBkcml2ZXIgbWF5IGNhbGwgdGhpcwo+Pj4gZnVu
Y3Rpb24gd2l0aCByZWFkeSBlcXVhbHMgZmFsc2UgYW5kIGFmdGVyIHNvbWUgdGltZSBjYWxsIGl0
IHdpdGggcmVhZHkKPj4+IGVxdWFscyB0cnVlLgo+Pgo+PiBHb29kIHBvaW50LCBzbyBJIHRoaW5r
IHdlIGNhbiBrZWVwIHRoZSBsb2dpYy4gQnV0IGxvb2tzIGxpa2UgdGhlCj4+IGNvZGUgY2FuIG5v
dCB3b3JrIGlmIHJlYWR5IGVxdWFscyBmYWxzZSBzaW5jZSBpdCBvbmx5IHRyaWVzIHRvCj4+IG1v
ZGlmeSB2cSBzdGF0ZSB0byBSRFkuCj4+Cj4gVGhlIHBvaW50IGlzIHRoYXQgeW91IGNhbm5vdCBt
b2RpZnkgdGhlIHZpcnRxdWV1ZSB0byAibm90IHJlYWR5Ii4KCgpJcyB0aGlzIGEgaGFyZHdhcmUg
bGltaXRhdGlvbiBvZiBzb2Z0d2FyZSBvbmU/CgpJJ20gYXNraW5nIHNpbmNlIHdlIG5lZWQgc3Vw
cG9ydCBsaXZlIG1pZ3JhdGlvbi4gQnV0IGEgcXVlc3Rpb25zIGlzIGhvdyAKdG8gc3RvcCB0aGUg
ZGV2aWNlIGJ1dCBub3QgcmVzZXQsIHNpbmNlIHdlIG5lZWQgZ2V0IGUuZyBsYXN0X2F2YWlsX2lk
eCAKZnJvbSB0aGUgZGV2aWNlLgoKSXQgY291bGQgYmUgZWl0aGVyOgoKMSkgc2V0X3N0YXR1cygw
KQoyKSBnZXRfdnFfc3RhdGUoKQoKb3IKCjEpIHNldF9xdWV1ZV9yZWFkeSgwKQoyKSBnZXRfdnFf
c3RhdGUoKQoKU2V0X3N0YXR1cygwKSBtZWFucyByZXNldCB0aGUgdmlydGlvIGRldmljZSBidXQg
bGFzdF9hdmFpbF9pZHggaXMgCnNvbWV0aGluZyBvdXQgb2YgdmlydGlvIHNwZWMuIEkgZ3Vlc3Mg
dXNpbmcgc2V0X3F1ZXVlX3JlYWR5KCkgaXMgYmV0dGVyLgoKV2hhdCdzIHlvdSBvcGluaW9uPwoK
VGhhbmtzCgoKPiAgIFRoZQo+IG9ubHkgb3B0aW9uIGlzIHRvIGRlc3Ryb3kgaXQgYW5kIGNyZWF0
ZSBhIG5ldyBvbmUuIFRoaXMgbWVhbnMgdGhhdCBpZiBJCj4gZ2V0IHJlYWR5IGVxdWFscyBmYWxz
ZSBhZnRlciB0aGUgdmlydHF1ZXVlIGhhcyBiZWVuIGNyZWF0ZWQgSSBuZWVkIHRvCj4gdGVhcmRv
d24gdGhlIGRyaXZlciBhbmQgc2V0IGl0IHVwIGFnYWluLgo+Cj4gR2l2ZW4gdGhhdCwgSSB0aGlu
ayB5b3VyIG9yaWdpbmFsIHN1Z2dlc3Rpb24gdG8gZGVmZXIgdGhpcyBsb2dpYyBpcwo+IHJlYXNv
bmFibGUuCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1m
b3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9s
aXN0aW5mby92aXJ0dWFsaXphdGlvbg==
