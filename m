Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E628D1AB67E
	for <lists.virtualization@lfdr.de>; Thu, 16 Apr 2020 06:07:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1A38221541;
	Thu, 16 Apr 2020 04:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iP2o+3JMUE3J; Thu, 16 Apr 2020 04:07:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5BDB120514;
	Thu, 16 Apr 2020 04:07:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 429A4C0172;
	Thu, 16 Apr 2020 04:07:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77FEEC0172
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 04:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 620808686A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 04:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Idqc6yB9LhXG
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 04:07:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 985AA86430
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 04:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587010070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OTMaR92SihjV5ChuxWQeel8tadAmxm943VhVpwb3Ti0=;
 b=NxyQqYmpAqE6rAjeeEtC3AGYqvBD1Z/7vAK+uIOzRDKXBzLXrfcu3u1llbA+hFEfNON6vq
 9W5cJnBcAom54uPiYrNSxsfR3a1qqYCaLdG+ifang6JT7BSQgHxTwjYG0Uzuzc+FSFtGRy
 q+c/Mk51ck3BC5+vgObHfgB7LKTwTuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-7eV2h5M0OHOPzkEfEcYyJw-1; Thu, 16 Apr 2020 00:07:44 -0400
X-MC-Unique: 7eV2h5M0OHOPzkEfEcYyJw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67ACC800D5C;
 Thu, 16 Apr 2020 04:07:13 +0000 (UTC)
Received: from [10.72.13.240] (ovpn-13-240.pek2.redhat.com [10.72.13.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 480FFD7664;
 Thu, 16 Apr 2020 04:07:07 +0000 (UTC)
Subject: Re: linux-next: Tree for Apr 15 (vdpa)
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20200415152240.2422e06c@canb.auug.org.au>
 <620e1646-5899-a077-b9de-95443887364d@infradead.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <33e4922f-d2b5-f3fa-4d32-a5db5a177238@redhat.com>
Date: Thu, 16 Apr 2020 12:07:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <620e1646-5899-a077-b9de-95443887364d@infradead.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: virtualization@lists.linux-foundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
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

Ck9uIDIwMjAvNC8xNiDkuIrljYgxMjoxNiwgUmFuZHkgRHVubGFwIHdyb3RlOgo+IE9uIDQvMTQv
MjAgMTA6MjIgUE0sIFN0ZXBoZW4gUm90aHdlbGwgd3JvdGU6Cj4+IEhpIGFsbCwKPj4KPj4gQ2hh
bmdlcyBzaW5jZSAyMDIwMDQxNDoKPj4KPiBvbiB4ODZfNjQ6Cj4KPiBFUlJPUjogbW9kcG9zdDog
InZyaW5naF9zZXRfaW90bGIiIFtkcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0ua29dIHVu
ZGVmaW5lZCEKPiBFUlJPUjogbW9kcG9zdDogInZyaW5naF9pbml0X2lvdGxiIiBbZHJpdmVycy92
ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmtvXSB1bmRlZmluZWQhCj4gRVJST1I6IG1vZHBvc3Q6ICJ2
cmluZ2hfaW92X3B1c2hfaW90bGIiIFtkcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0ua29d
IHVuZGVmaW5lZCEKPiBFUlJPUjogbW9kcG9zdDogInZyaW5naF9pb3ZfcHVsbF9pb3RsYiIgW2Ry
aXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5rb10gdW5kZWZpbmVkIQo+IEVSUk9SOiBtb2Rw
b3N0OiAidnJpbmdoX2NvbXBsZXRlX2lvdGxiIiBbZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFf
c2ltLmtvXSB1bmRlZmluZWQhCj4gRVJST1I6IG1vZHBvc3Q6ICJ2cmluZ2hfZ2V0ZGVzY19pb3Rs
YiIgW2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5rb10gdW5kZWZpbmVkIQo+Cj4KPiBG
dWxsIHJhbmRjb25maWcgZmlsZSBpcyBhdHRhY2hlZC4KPgoKVGhlIGNvbmZpZyBoYXMKCkNPTkZJ
R19WSE9TVF9JT1RMQj1tCkNPTkZJR19WSE9TVF9SSU5HPXkKCkJ1dCB3ZSBkb24ndCBzZWxlY3Qg
VkhPU1RfSU9UTEIgaW4gVkhPU1RfUklORyBhZnRlciBjb21taXQgCmU2ZmFlYWExMjg0MTcoInZo
b3N0OiBkcm9wIHZyaW5nIGRlcGVuZGVuY3kgb24gaW90bGIiKS4gV2hpY2ggc2VlbXMgd3Jvbmcu
CgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1m
b3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9s
aXN0aW5mby92aXJ0dWFsaXphdGlvbg==
