Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C30841A77A2
	for <lists.virtualization@lfdr.de>; Tue, 14 Apr 2020 11:48:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8E9D52044A;
	Tue, 14 Apr 2020 09:48:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LmFaa9U+SN93; Tue, 14 Apr 2020 09:48:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D149D20372;
	Tue, 14 Apr 2020 09:48:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6205C0172;
	Tue, 14 Apr 2020 09:48:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65272C0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 09:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 423672037E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 09:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bjD5Q824ZwbI
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 09:48:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 6C96320482
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 09:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586857701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCUnMVTMhiXmQTIRtH4ig9vejIyMaafXsJBXVyt/T0o=;
 b=Qx9SLKZnYhNTbLa8p/DYIAU0u2He3JEZV5OKgGMkD4j2ar8VvcMvI9spYac/1V3on30r2I
 gbJce48bO5HPmbEmghmwYgdkOH95MFmGVN4ZtiTnORz2dRt/vYrruVIsTRvK9PJofjgjuB
 2vmruUNOZBfI96c2As4BSe9rWipu3HM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-qE1gTkkzPsijc6xmZp2iOg-1; Tue, 14 Apr 2020 05:48:17 -0400
X-MC-Unique: qE1gTkkzPsijc6xmZp2iOg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF2DE800D53;
 Tue, 14 Apr 2020 09:48:13 +0000 (UTC)
Received: from [10.72.13.119] (ovpn-13-119.pek2.redhat.com [10.72.13.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7602F1001920;
 Tue, 14 Apr 2020 09:48:05 +0000 (UTC)
Subject: Re: [PATCH] vhost: do not enable VHOST_MENU by default
To: Christian Borntraeger <borntraeger@de.ibm.com>, mst@redhat.com
References: <20200414024438.19103-1-jasowang@redhat.com>
 <375181ee-08ec-77a6-2dfc-f3c9c26705a1@de.ibm.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <802e6da9-4827-a9a4-b409-f08a5de4e750@redhat.com>
Date: Tue, 14 Apr 2020 17:48:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <375181ee-08ec-77a6-2dfc-f3c9c26705a1@de.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: linux-s390@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Vasily Gorbik <gor@linux.ibm.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-mips@vger.kernel.org, virtualization@lists.linux-foundation.org,
 geert@linux-m68k.org, Michael Ellerman <mpe@ellerman.id.au>,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
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

Ck9uIDIwMjAvNC8xNCDkuIvljYgzOjI2LCBDaHJpc3RpYW4gQm9ybnRyYWVnZXIgd3JvdGU6Cj4g
T24gMTQuMDQuMjAgMDQ6NDQsIEphc29uIFdhbmcgd3JvdGU6Cj4+IFdlIHRyeSB0byBrZWVwIHRo
ZSBkZWZjb25maWcgdW50b3VjaGVkIGFmdGVyIGRlY291cGxpbmcgQ09ORklHX1ZIT1NUCj4+IG91
dCBvZiBDT05GSUdfVklSVFVBTElaQVRJT04gaW4gY29tbWl0IDIwYzM4NGYxZWExYQo+PiAoInZo
b3N0OiByZWZpbmUgdmhvc3QgYW5kIHZyaW5naCBrY29uZmlnIikgYnkgZW5hYmxpbmcgVkhPU1Rf
TUVOVSBieQo+PiBkZWZhdWx0LiBUaGVuIHRoZSBkZWZjb25maWdzIGNhbiBrZWVwIGVuYWJsaW5n
IENPTkZJR19WSE9TVF9ORVQKPj4gd2l0aG91dCB0aGUgY2FyaW5nIG9mIENPTkZJR19WSE9TVC4K
Pj4KPj4gQnV0IHRoaXMgd2lsbCBsZWF2ZSBhICJDT05GSUdfVkhPU1RfTUVOVT15IiBpbiBhbGwg
ZGVmY29uZmlncyBhbmQgZXZlbgo+PiBmb3IgdGhlIG9uZXMgdGhhdCBkb2Vzbid0IHdhbnQgdmhv
c3QuIFNvIGl0IGFjdHVhbGx5IHNoaWZ0cyB0aGUKPj4gYnVyZGVucyB0byB0aGUgbWFpbnRhaW5l
cnMgb2YgYWxsIG90aGVyIHRvIGFkZCAiQ09ORklHX1ZIT1NUX01FTlUgaXMKPj4gbm90IHNldCIu
IFNvIHRoaXMgcGF0Y2ggdHJpZXMgdG8gZW5hYmxlIENPTkZJR19WSE9TVCBleHBsaWNpdGx5IGlu
Cj4+IGRlZmNvbmZpZ3MgdGhhdCBlbmFibGVzIENPTkZJR19WSE9TVF9ORVQgYW5kIENPTkZJR19W
SE9TVF9WU09DSy4KPj4KPj4gQ2M6IFRob21hcyBCb2dlbmRvZXJmZXI8dHNib2dlbmRAYWxwaGEu
ZnJhbmtlbi5kZT4KPj4gQ2M6IEJlbmphbWluIEhlcnJlbnNjaG1pZHQ8YmVuaEBrZXJuZWwuY3Jh
c2hpbmcub3JnPgo+PiBDYzogUGF1bCBNYWNrZXJyYXM8cGF1bHVzQHNhbWJhLm9yZz4KPj4gQ2M6
IE1pY2hhZWwgRWxsZXJtYW48bXBlQGVsbGVybWFuLmlkLmF1Pgo+PiBDYzogSGVpa28gQ2Fyc3Rl
bnM8aGVpa28uY2Fyc3RlbnNAZGUuaWJtLmNvbT4KPj4gQ2M6IFZhc2lseSBHb3JiaWs8Z29yQGxp
bnV4LmlibS5jb20+Cj4+IENjOiBDaHJpc3RpYW4gQm9ybnRyYWVnZXI8Ym9ybnRyYWVnZXJAZGUu
aWJtLmNvbT4KPiBGaW5lIHdpdGggbWUuCj4gczM5MCBwYXJ0Cj4KPiBBY2tlZC1ieTogQ2hyaXN0
aWFuIEJvcm50cmFlZ2VyPGJvcm50cmFlZ2VyQGRlLmlibS5jb20+Cj4KPiAgIFRoYXQgd2FzIG15
IGZpcnN0IGFwcHJvYWNoIHRvIGdldCB0aGluZ3MgZml4ZWQgYmVmb3JlIEkgcmVwb3J0ZWQKPiB0
aGlzIHRvIHlvdS4KCgpFeGFjdGx5LgoKVGhhbmtzCgo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmly
dHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
