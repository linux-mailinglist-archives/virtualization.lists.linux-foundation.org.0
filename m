Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DA51F8C4D
	for <lists.virtualization@lfdr.de>; Mon, 15 Jun 2020 04:44:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 49635872DC;
	Mon, 15 Jun 2020 02:43:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l77sj7PsLnMG; Mon, 15 Jun 2020 02:43:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BD866872CA;
	Mon, 15 Jun 2020 02:43:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5702C016E;
	Mon, 15 Jun 2020 02:43:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EBE95C016E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 02:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E0F2923119
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 02:43:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id msNMjhulGVOu
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 02:43:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id DF9E8220CA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 02:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592189033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CDf2ubutxAR6PnZDzVX0vkP0DzBLtkr2OZNFYDY7Wa0=;
 b=EcArHfigCkC3lWILCvUQln660S4+IqDUHkf6euu6PImrfuJkXRB6flUOs88dQk/uleu7L3
 lR4CZncVSlF/nSt54FFDaxYCH08O+/peVqIqGCSS/RZz4j8Qj19H8xxPwJn59FyO68nMrr
 oDS7Y6TD38nG//IT3DtJBXg7N8QiauQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-zrMBqGQyM0aTkj5DQlI_rw-1; Sun, 14 Jun 2020 22:43:51 -0400
X-MC-Unique: zrMBqGQyM0aTkj5DQlI_rw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D412108BD1A;
 Mon, 15 Jun 2020 02:43:50 +0000 (UTC)
Received: from [10.72.13.232] (ovpn-13-232.pek2.redhat.com [10.72.13.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 602001A91F;
 Mon, 15 Jun 2020 02:43:44 +0000 (UTC)
Subject: Re: [PATCH RFC v6 02/11] vhost: use batched get_vq_desc version
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200608125238.728563-1-mst@redhat.com>
 <20200608125238.728563-3-mst@redhat.com>
 <81904cc5-b662-028d-3b4a-bdfdbd2deb8c@redhat.com>
 <20200610070259-mutt-send-email-mst@kernel.org>
 <76b14132-407a-48bf-c4d5-9d0b2c700bb0@redhat.com>
 <20200611050416-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <be533349-817c-925b-43e4-899185d3fb1a@redhat.com>
Date: Mon, 15 Jun 2020 10:43:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611050416-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: netdev@vger.kernel.org, eperezma@redhat.com, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNi8xMSDkuIvljYg1OjA2LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VGh1LCBKdW4gMTEsIDIwMjAgYXQgMTE6MDI6NTdBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAyMC82LzEwIOS4i+WNiDc6MDUsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
Pj4gK0VYUE9SVF9TWU1CT0xfR1BMKHZob3N0X2dldF92cV9kZXNjKTsKPj4+Pj4gICAgIC8qIFJl
dmVyc2UgdGhlIGVmZmVjdCBvZiB2aG9zdF9nZXRfdnFfZGVzYy4gVXNlZnVsIGZvciBlcnJvciBo
YW5kbGluZy4gKi8KPj4+Pj4gICAgIHZvaWQgdmhvc3RfZGlzY2FyZF92cV9kZXNjKHN0cnVjdCB2
aG9zdF92aXJ0cXVldWUgKnZxLCBpbnQgbikKPj4+Pj4gICAgIHsKPj4+Pj4gKwl1bmZldGNoX2Rl
c2NzKHZxKTsKPj4+Pj4gICAgIAl2cS0+bGFzdF9hdmFpbF9pZHggLT0gbjsKPj4+PiBTbyB1bmZl
dGNoX2Rlc2NzKCkgaGFzIGRlY3JlYXNlZCBsYXN0X2F2YWlsX2lkeC4KPj4+PiBDYW4gd2UgZml4
IHRoaXMgYnkgbGV0dGluZyB1bmZldGNoX2Rlc2NzKCkgcmV0dXJuIHRoZSBudW1iZXIgYW5kIHRo
ZW4gd2UgY2FuCj4+Pj4gZG86Cj4+Pj4KPj4+PiBpbnQgZCA9IHVuZmV0Y2hfZGVzY3ModnEpOwo+
Pj4+IHZxLT5sYXN0X2F2YWlsX2lkeCAtPSAobiA+IGQpID8gbiAtIGQ6IDA7Cj4+Pj4KPj4+PiBU
aGFua3MKPj4+IFRoYXQncyBpbnRlbnRpb25hbCBJIHRoaW5rIC0gd2UgbmVlZCBib3RoLgo+Pgo+
PiBZZXMsIGJ1dDoKPj4KPj4KPj4+IFVuZmV0Y2hfZGVzY3MgZHJvcHMgdGhlIGRlc2NyaXB0b3Jz
IGluIHRoZSBjYWNoZSB0aGF0IHdlcmUKPj4+ICpub3QgcmV0dXJuZWQgdG8gY2FsbGVyKiAgdGhy
b3VnaCBnZXRfdnFfZGVzYy4KPj4+Cj4+PiB2aG9zdF9kaXNjYXJkX3ZxX2Rlc2MgZHJvcHMgdGhl
IG9uZXMgdGhhdCB3ZXJlIHJldHVybmVkIHRocm91Z2ggZ2V0X3ZxX2Rlc2MuCj4+Pgo+Pj4gRGlk
IEkgbWlzcyBhbnl0aGluZz8KPj4gV2UgY291bGQgY291bnQgc29tZSBkZXNjcmlwdG9ycyB0d2lj
ZSwgY29uc2lkZXIgdGhlIGNhc2UgZS5nIHdlIG9ubHkgY2FjaGUKPj4gb24gZGVzY3JpcHRvcjoK
Pj4KPj4gZmV0Y2hfZGVzY3MoKQo+PiAgwqDCoMKgIGZldGNoX2J1ZigpCj4+ICDCoMKgwqAgwqDC
oMKgIGxhc3RfYXZhaWxfaWR4Kys7Cj4+Cj4+IFRoZW4gd2Ugd2FudCBkbyBkaXNjYXJkIGl0Ogo+
PiB2aG9zdF9kaXNjYXJkX2F2YWlsX2J1ZigxKQo+PiAgwqDCoMKgIHVuZmV0Y2hfZGVzY3MoKQo+
PiAgwqDCoMKgIMKgwqDCoCBsYXN0X2F2YWlsX2lkeC0tOwo+PiAgwqDCoMKgIGxhc3RfYXZhaWxf
aWR4IC09IDE7Cj4+Cj4+IFRoYW5rcwo+Cj4gSSBkb24ndCB0aGluayB0aGF0IGhhcHBlbnMuIHZo
b3N0X2Rpc2NhcmRfYXZhaWxfYnVmKDEpIGlzIG9ubHkgY2FsbGVkCj4gYWZ0ZXIgZ2V0IHZob3N0
X2dldF9hdmFpbF9idWYuIHZob3N0X2dldF9hdmFpbF9idWYgaW5jcmVtZW50cwo+IGZpcnN0X2Rl
c2MuICB1bmZldGNoX2Rlc2NzIG9ubHkgY291bnRzIGZyb20gZmlyc3RfZGVzYyB0byBuZGVzY3Mu
Cj4KPiBJZiBJJ20gd3JvbmcsIGNvdWxkIHlvdSBzaG93IHZhbHVlcyBvZiBmaXJzdF9kZXNjIGFu
ZCBuZGVzY3MgaW4gdGhpcwo+IHNjZW5hcmlvPwoKCllvdSdyZSByaWdodCwgZmV0Y2hfZGVzY3Jp
cHRvciBjb3VsZCBub3QgYmUgY2FsbGVkIGRpcmVjdGx5IGZyb20gdGhlIApkZXZpY2UgY29kZS4K
ClRoYW5rcwoKCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
