Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C18187189
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 07:35:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 77E18C75;
	Fri,  9 Aug 2019 05:35:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7F42DC58
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 05:35:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 34C8967F
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 05:35:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76B7B8E90C;
	Fri,  9 Aug 2019 05:35:41 +0000 (UTC)
Received: from [10.72.12.241] (ovpn-12-241.pek2.redhat.com [10.72.12.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F54C60BF3;
	Fri,  9 Aug 2019 05:35:33 +0000 (UTC)
Subject: Re: [PATCH V4 0/9] Fixes for metadata accelreation
To: David Miller <davem@davemloft.net>
References: <20190807070617.23716-1-jasowang@redhat.com>
	<20190808.221543.450194346419371363.davem@davemloft.net>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1aaec9aa-7832-35e2-a58d-99bcc2998ce8@redhat.com>
Date: Fri, 9 Aug 2019 13:35:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808.221543.450194346419371363.davem@davemloft.net>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 09 Aug 2019 05:35:41 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jgg@ziepe.ca, kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvOC85IOS4i+WNiDE6MTUsIERhdmlkIE1pbGxlciB3cm90ZToKPiBGcm9tOiBKYXNv
biBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+IERhdGU6IFdlZCwgIDcgQXVnIDIwMTkgMDM6
MDY6MDggLTA0MDAKPgo+PiBUaGlzIHNlcmllcyB0cnkgdG8gZml4IHNldmVyYWwgaXNzdWVzIGlu
dHJvZHVjZWQgYnkgbWV0YSBkYXRhCj4+IGFjY2VscmVhdGlvbiBzZXJpZXMuIFBsZWFzZSByZXZp
ZXcuCj4gICAuLi4KPgo+IE15IGltcHJlc3Npb24gaXMgdGhhdCBwYXRjaCAjNyB3aWxsIGJlIGNo
YW5nZWQgdG8gdXNlIHNwaW5sb2NrcyBzbyB0aGVyZQo+IHdpbGwgYmUgYSB2NS4KPgoKWWVzLiBW
NSBpcyBvbiB0aGUgd2F5LgoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRp
b25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
