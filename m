Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E34E71989EC
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 04:28:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 89B59869CA;
	Tue, 31 Mar 2020 02:28:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E2ZUEaCdWVqm; Tue, 31 Mar 2020 02:28:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 17405869C4;
	Tue, 31 Mar 2020 02:28:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E06EAC07FF;
	Tue, 31 Mar 2020 02:28:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2574C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 02:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A124D8834C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 02:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pAptXfgeSPJG
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 02:28:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E0E3E87E30
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 02:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585621678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q2t+J3lF5AuQxznbMUm1nciYFyVRK4OogfDMwj7plOg=;
 b=ZIHIB8heW+xBsxMoCvlRqaqH/EyLjpknxUY1Yx/RoNlj9nzGd0P1xF7mOWIu76iAXbHPaT
 q4Ko1hteb3ZMNJiT59618uyKBCBAeMH4yWTD+GosS4r301WBslzxTJrsrhIYjotqLP8whY
 FYPWYmzhTRKzciKml2tkRydQ+CLpbUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-5evQtK8jNxSPzYKNQlUjZA-1; Mon, 30 Mar 2020 22:27:56 -0400
X-MC-Unique: 5evQtK8jNxSPzYKNQlUjZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEA66800D5B;
 Tue, 31 Mar 2020 02:27:54 +0000 (UTC)
Received: from [10.72.12.115] (ovpn-12-115.pek2.redhat.com [10.72.12.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 402E01001B3F;
 Tue, 31 Mar 2020 02:27:49 +0000 (UTC)
Subject: Re: linux-next: Tree for Mar 30 (vhost)
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20200330204307.669bbb4d@canb.auug.org.au>
 <347c851a-b9f6-0046-f6c8-1db0b42be213@infradead.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <649927d4-9851-c369-2ad2-bf25527b057a@redhat.com>
Date: Tue, 31 Mar 2020 10:27:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <347c851a-b9f6-0046-f6c8-1db0b42be213@infradead.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 KVM <kvm@vger.kernel.org>, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvMy8zMSDkuIrljYgxOjIyLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4gT24gMy8zMC8y
MCAyOjQzIEFNLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3RlOgo+PiBIaSBhbGwsCj4+Cj4+IFRoZSBt
ZXJnZSB3aW5kb3cgaGFzIG9wZW5lZCwgc28gcGxlYXNlIGRvIG5vdCBhZGQgYW55IG1hdGVyaWFs
IGZvciB0aGUKPj4gbmV4dCByZWxlYXNlIGludG8geW91ciBsaW51eC1uZXh0IGluY2x1ZGVkIHRy
ZWVzL2JyYW5jaGVzIHVudGlsIGFmdGVyCj4+IHRoZSBtZXJnZSB3aW5kb3cgY2xvc2VzLgo+Pgo+
PiBDaGFuZ2VzIHNpbmNlIDIwMjAwMzI3Ogo+Pgo+PiBUaGUgdmhvc3QgdHJlZSBnYWluZWQgYSBj
b25mbGljdCBhZ2FpbnN0IHRoZSBrdm0tYXJtIHRyZWUuCj4+Cj4gKG5vdGU6IHRvZGF5J3MgbGlu
dXgtbmV4dCBpcyBvbiA1LjYtcmM3LikKPgo+IG9uIHg4Nl82NDoKPgo+ICMgQ09ORklHX0VWRU5U
RkQgaXMgbm90IHNldAo+Cj4gLi4vZHJpdmVycy92aG9zdC92aG9zdC5jOiBJbiBmdW5jdGlvbiAn
dmhvc3RfdnJpbmdfaW9jdGwnOgo+IC4uL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYzoxNTc3OjMzOiBl
cnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ2V2ZW50ZmRfZmdldCc7IGRp
ZCB5b3UgbWVhbiAnZXZlbnRmZF9zaWduYWwnPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1k
ZWNsYXJhdGlvbl0KPiAgICAgZXZlbnRmcCA9IGYuZmQgPT0gLTEgPyBOVUxMIDogZXZlbnRmZF9m
Z2V0KGYuZmQpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+
fn4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZXZlbnRmZF9zaWduYWwKPiAu
Li9kcml2ZXJzL3Zob3N0L3Zob3N0LmM6MTU3NzozMTogd2FybmluZzogcG9pbnRlci9pbnRlZ2Vy
IHR5cGUgbWlzbWF0Y2ggaW4gY29uZGl0aW9uYWwgZXhwcmVzc2lvbgo+ICAgICBldmVudGZwID0g
Zi5mZCA9PSAtMSA/IE5VTEwgOiBldmVudGZkX2ZnZXQoZi5mZCk7CgoKV2lsbCBmaXguCgpWSE9T
VCBzaG91bGQgZGVwZW5kIG9uIEVWRU5URkQgbm93LgoKVGhhbmtzCgoKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9u
QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
