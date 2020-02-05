Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 983B915261E
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 06:51:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 14D5181C6B;
	Wed,  5 Feb 2020 05:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o5bDSSIT+RG2; Wed,  5 Feb 2020 05:51:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 58AAE8466D;
	Wed,  5 Feb 2020 05:51:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3CA79C0174;
	Wed,  5 Feb 2020 05:51:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4FC7C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 05:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A3A3E873B6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 05:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LrylrU-YLngw
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 05:51:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BEA2087364
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 05:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580881877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mCCBz5Rdlbkg4ojmDomdGX6wRFkIiLU8SA3hhtwlDwg=;
 b=CDTocgNrNp/v/MPRdY1Z1xxqJcI6aeDY7cangVdqK8AbeIPTKYirbe48ezIr9SD4E0ycGs
 OE/J23fr9EYDJso0eoWIcOxpy1LXKxxWzQUYsd6BEGrPX1YQKmTOe58RydpsKGEnnlLijg
 afxOx7Y3aLl6N68CZckMirWa3CWjS1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-BTzEyaLKMeuvyVcErxsMpw-1; Wed, 05 Feb 2020 00:51:15 -0500
X-MC-Unique: BTzEyaLKMeuvyVcErxsMpw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C27D1034B21;
 Wed,  5 Feb 2020 05:51:13 +0000 (UTC)
Received: from [10.72.13.188] (ovpn-13-188.pek2.redhat.com [10.72.13.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C1C548;
 Wed,  5 Feb 2020 05:50:36 +0000 (UTC)
Subject: Re: [PATCH] vhost: introduce vDPA based backend
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <7aab2892-bb19-a06a-a6d3-9c28bc4c3400@redhat.com>
 <20200204005306-mutt-send-email-mst@kernel.org>
 <cf485e7f-46e3-20d3-8452-e3058b885d0a@redhat.com>
 <20200205020555.GA369236@___>
 <798e5644-ca28-ee46-c953-688af9bccd3b@redhat.com>
 <20200205003048-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <eb53d1c2-92ae-febf-f502-2d3e107ee608@redhat.com>
Date: Wed, 5 Feb 2020 13:50:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200205003048-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: kvm@vger.kernel.org, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, jgg@mellanox.com,
 rob.miller@broadcom.com, lulu@redhat.com, maxime.coquelin@redhat.com,
 hch@infradead.org, eperezma@redhat.com, haotian.wang@sifive.com,
 shahafs@mellanox.com, parav@mellanox.com, jiri@mellanox.com,
 zhihong.wang@intel.com, netdev@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, hanand@xilinx.com, lingshan.zhu@intel.com
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

Ck9uIDIwMjAvMi81IOS4i+WNiDE6MzEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBX
ZWQsIEZlYiAwNSwgMjAyMCBhdCAxMToxMjoyMUFNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDIwLzIvNSDkuIrljYgxMDowNSwgVGl3ZWkgQmllIHdyb3RlOgo+Pj4gT24gVHVlLCBG
ZWIgMDQsIDIwMjAgYXQgMDI6NDY6MTZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+PiBP
biAyMDIwLzIvNCDkuIvljYgyOjAxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+Pj4+IE9u
IFR1ZSwgRmViIDA0LCAyMDIwIGF0IDExOjMwOjExQU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6
Cj4+Pj4+PiA1KSBnZW5lcmF0ZSBkaWZmcyBvZiBtZW1vcnkgdGFibGUgYW5kIHVzaW5nIElPTU1V
IEFQSSB0byBzZXR1cCB0aGUgZG1hCj4+Pj4+PiBtYXBwaW5nIGluIHRoaXMgbWV0aG9kCj4+Pj4+
IEZyYW5rbHkgSSB0aGluayB0aGF0J3MgYSBidW5jaCBvZiB3b3JrLiBXaHkgbm90IGEgTUFQL1VO
TUFQIGludGVyZmFjZT8KPj4+Pj4KPj4+PiBTdXJlLCBzbyB0aGF0IGJhc2ljYWxseSBWSE9TVF9J
T1RMQl9VUERBVEUvSU5WQUxJREFURSBJIHRoaW5rPwo+Pj4gRG8geW91IG1lYW4gd2UgbGV0IHVz
ZXJzcGFjZSB0byBvbmx5IHVzZSBWSE9TVF9JT1RMQl9VUERBVEUvSU5WQUxJREFURQo+Pj4gdG8g
ZG8gdGhlIERNQSBtYXBwaW5nIGluIHZob3N0LXZkcGEgY2FzZT8gV2hlbiB2SU9NTVUgaXNuJ3Qg
YXZhaWxhYmxlLAo+Pj4gdXNlcnNwYWNlIHdpbGwgc2V0IG1zZy0+aW92YSB0byBHUEEsIG90aGVy
d2lzZSB1c2Vyc3BhY2Ugd2lsbCBzZXQKPj4+IG1zZy0+aW92YSB0byBHSU9WQSwgYW5kIHZob3N0
LXZkcGEgbW9kdWxlIHdpbGwgZ2V0IEhQQSBmcm9tIG1zZy0+dWFkZHI/Cj4+Pgo+Pj4gVGhhbmtz
LAo+Pj4gVGl3ZWkKPj4gSSB0aGluayBzby4gTWljaGFlbCwgZG8geW91IHRoaW5rIHRoaXMgbWFr
ZXMgc2Vuc2U/Cj4+Cj4+IFRoYW5rcwo+IHRvIG1ha2Ugc3VyZSwgY291bGQgeW91IHBvc3QgdGhl
IHN1Z2dlc3RlZCBhcmd1bWVudCBmb3JtYXQgZm9yCj4gdGhlc2UgaW9jdGxzPwo+CgpJdCdzIHRo
ZSBleGlzdGVkIHVhcGk6CgovKiBubyBhbGlnbm1lbnQgcmVxdWlyZW1lbnQgKi8Kc3RydWN0IHZo
b3N0X2lvdGxiX21zZyB7CiDCoMKgwqAgX191NjQgaW92YTsKIMKgwqDCoCBfX3U2NCBzaXplOwog
wqDCoMKgIF9fdTY0IHVhZGRyOwojZGVmaW5lIFZIT1NUX0FDQ0VTU19ST8KgwqDCoMKgwqAgMHgx
CiNkZWZpbmUgVkhPU1RfQUNDRVNTX1dPwqDCoMKgwqDCoCAweDIKI2RlZmluZSBWSE9TVF9BQ0NF
U1NfUlfCoMKgwqDCoMKgIDB4MwogwqDCoMKgIF9fdTggcGVybTsKI2RlZmluZSBWSE9TVF9JT1RM
Ql9NSVNTwqDCoMKgwqDCoMKgwqDCoMKgwqAgMQojZGVmaW5lIFZIT1NUX0lPVExCX1VQREFURcKg
wqDCoMKgwqDCoMKgwqAgMgojZGVmaW5lIFZIT1NUX0lPVExCX0lOVkFMSURBVEXCoMKgwqDCoCAz
CiNkZWZpbmUgVkhPU1RfSU9UTEJfQUNDRVNTX0ZBSUzCoMKgwqAgNAogwqDCoMKgIF9fdTggdHlw
ZTsKfTsKCiNkZWZpbmUgVkhPU1RfSU9UTEJfTVNHIDB4MQojZGVmaW5lIFZIT1NUX0lPVExCX01T
R19WMiAweDIKCnN0cnVjdCB2aG9zdF9tc2cgewogwqDCoMKgIGludCB0eXBlOwogwqDCoMKgIHVu
aW9uIHsKIMKgwqDCoCDCoMKgwqAgc3RydWN0IHZob3N0X2lvdGxiX21zZyBpb3RsYjsKIMKgwqDC
oCDCoMKgwqAgX191OCBwYWRkaW5nWzY0XTsKIMKgwqDCoCB9Owp9OwoKc3RydWN0IHZob3N0X21z
Z192MiB7CiDCoMKgwqAgX191MzIgdHlwZTsKIMKgwqDCoCBfX3UzMiByZXNlcnZlZDsKIMKgwqDC
oCB1bmlvbiB7CiDCoMKgwqAgwqDCoMKgIHN0cnVjdCB2aG9zdF9pb3RsYl9tc2cgaW90bGI7CiDC
oMKgwqAgwqDCoMKgIF9fdTggcGFkZGluZ1s2NF07CiDCoMKgwqAgfTsKfTsKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
