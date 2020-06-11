Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B111F6043
	for <lists.virtualization@lfdr.de>; Thu, 11 Jun 2020 05:03:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9E4CA25C9B;
	Thu, 11 Jun 2020 03:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uaHaQ3BJRjyZ; Thu, 11 Jun 2020 03:03:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A4133265FF;
	Thu, 11 Jun 2020 03:03:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85E26C0891;
	Thu, 11 Jun 2020 03:03:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F23CC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 03:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0DCFF88638
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 03:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vryc3CqjGtPH
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 03:03:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 454C688647
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 03:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591844586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pW0TC9adqhgXolpM+bqi6ACajbaD8dcdKR1gGXD2XZ8=;
 b=CPVVxfYGOTPOobCZqLEd74yuGdw6YQDaK1zYzktJTUjxQJt3tv5cQKRgTqz9FRRumvwfhr
 n0Rsk3ZSCNCQATWH38EuTLuosjiYYm1mMeO4yfRwvmwqlViu6O7hrZhVFH+LRkJlHpycFA
 wWOQ2Rh9OL9nxkadX+kEbIJ8DG00Wks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-0vO_5UApMFapwqJRy4-PSw-1; Wed, 10 Jun 2020 23:03:04 -0400
X-MC-Unique: 0vO_5UApMFapwqJRy4-PSw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A5A97BBE;
 Thu, 11 Jun 2020 03:03:03 +0000 (UTC)
Received: from [10.72.12.125] (ovpn-12-125.pek2.redhat.com [10.72.12.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CBBA8929C;
 Thu, 11 Jun 2020 03:02:58 +0000 (UTC)
Subject: Re: [PATCH RFC v6 02/11] vhost: use batched get_vq_desc version
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200608125238.728563-1-mst@redhat.com>
 <20200608125238.728563-3-mst@redhat.com>
 <81904cc5-b662-028d-3b4a-bdfdbd2deb8c@redhat.com>
 <20200610070259-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <76b14132-407a-48bf-c4d5-9d0b2c700bb0@redhat.com>
Date: Thu, 11 Jun 2020 11:02:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610070259-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Ck9uIDIwMjAvNi8xMCDkuIvljYg3OjA1LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiAr
RVhQT1JUX1NZTUJPTF9HUEwodmhvc3RfZ2V0X3ZxX2Rlc2MpOwo+Pj4gICAgLyogUmV2ZXJzZSB0
aGUgZWZmZWN0IG9mIHZob3N0X2dldF92cV9kZXNjLiBVc2VmdWwgZm9yIGVycm9yIGhhbmRsaW5n
LiAqLwo+Pj4gICAgdm9pZCB2aG9zdF9kaXNjYXJkX3ZxX2Rlc2Moc3RydWN0IHZob3N0X3ZpcnRx
dWV1ZSAqdnEsIGludCBuKQo+Pj4gICAgewo+Pj4gKwl1bmZldGNoX2Rlc2NzKHZxKTsKPj4+ICAg
IAl2cS0+bGFzdF9hdmFpbF9pZHggLT0gbjsKPj4gU28gdW5mZXRjaF9kZXNjcygpIGhhcyBkZWNy
ZWFzZWQgbGFzdF9hdmFpbF9pZHguCj4+IENhbiB3ZSBmaXggdGhpcyBieSBsZXR0aW5nIHVuZmV0
Y2hfZGVzY3MoKSByZXR1cm4gdGhlIG51bWJlciBhbmQgdGhlbiB3ZSBjYW4KPj4gZG86Cj4+Cj4+
IGludCBkID0gdW5mZXRjaF9kZXNjcyh2cSk7Cj4+IHZxLT5sYXN0X2F2YWlsX2lkeCAtPSAobiA+
IGQpID8gbiAtIGQ6IDA7Cj4+Cj4+IFRoYW5rcwo+IFRoYXQncyBpbnRlbnRpb25hbCBJIHRoaW5r
IC0gd2UgbmVlZCBib3RoLgoKClllcywgYnV0OgoKCj4KPiBVbmZldGNoX2Rlc2NzIGRyb3BzIHRo
ZSBkZXNjcmlwdG9ycyBpbiB0aGUgY2FjaGUgdGhhdCB3ZXJlCj4gKm5vdCByZXR1cm5lZCB0byBj
YWxsZXIqICB0aHJvdWdoIGdldF92cV9kZXNjLgo+Cj4gdmhvc3RfZGlzY2FyZF92cV9kZXNjIGRy
b3BzIHRoZSBvbmVzIHRoYXQgd2VyZSByZXR1cm5lZCB0aHJvdWdoIGdldF92cV9kZXNjLgo+Cj4g
RGlkIEkgbWlzcyBhbnl0aGluZz8KCldlIGNvdWxkIGNvdW50IHNvbWUgZGVzY3JpcHRvcnMgdHdp
Y2UsIGNvbnNpZGVyIHRoZSBjYXNlIGUuZyB3ZSBvbmx5IApjYWNoZSBvbiBkZXNjcmlwdG9yOgoK
ZmV0Y2hfZGVzY3MoKQogwqDCoMKgIGZldGNoX2J1ZigpCiDCoMKgwqAgwqDCoMKgIGxhc3RfYXZh
aWxfaWR4Kys7CgpUaGVuIHdlIHdhbnQgZG8gZGlzY2FyZCBpdDoKdmhvc3RfZGlzY2FyZF9hdmFp
bF9idWYoMSkKIMKgwqDCoCB1bmZldGNoX2Rlc2NzKCkKIMKgwqDCoCDCoMKgwqAgbGFzdF9hdmFp
bF9pZHgtLTsKIMKgwqDCoCBsYXN0X2F2YWlsX2lkeCAtPSAxOwoKVGhhbmtzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWls
aW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRp
b24=
