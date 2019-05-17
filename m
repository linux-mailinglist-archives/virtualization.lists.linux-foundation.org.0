Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8971B21190
	for <lists.virtualization@lfdr.de>; Fri, 17 May 2019 03:05:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3AEC2AD0;
	Fri, 17 May 2019 01:05:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0F65CAD0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 01:05:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CB5BB82C
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 01:05:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D4D430001DD;
	Fri, 17 May 2019 01:05:39 +0000 (UTC)
Received: from [10.72.12.67] (ovpn-12-67.pek2.redhat.com [10.72.12.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58EBB7941E;
	Fri, 17 May 2019 01:05:32 +0000 (UTC)
Subject: Re: [PATCH net 3/4] vhost: vsock: add weight support
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <1557992862-27320-1-git-send-email-jasowang@redhat.com>
	<1557992862-27320-4-git-send-email-jasowang@redhat.com>
	<20190516093352.GQ29507@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <70c24182-9238-1a69-8e35-53c98b957bc7@redhat.com>
Date: Fri, 17 May 2019 09:05:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516093352.GQ29507@stefanha-x1.localdomain>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Fri, 17 May 2019 01:05:39 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, pbonzini@redhat.com
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

Ck9uIDIwMTkvNS8xNiDkuIvljYg1OjMzLCBTdGVmYW4gSGFqbm9jemkgd3JvdGU6Cj4gT24gVGh1
LCBNYXkgMTYsIDIwMTkgYXQgMDM6NDc6NDFBTSAtMDQwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4g
QEAgLTE4Myw3ICsxODQsOCBAQCBzdGF0aWMgc3RydWN0IHZob3N0X3Zzb2NrICp2aG9zdF92c29j
a19nZXQodTMyIGd1ZXN0X2NpZCkKPj4gICAJCXZpcnRpb190cmFuc3BvcnRfZGVsaXZlcl90YXBf
cGt0KHBrdCk7Cj4+ICAgCj4+ICAgCQl2aXJ0aW9fdHJhbnNwb3J0X2ZyZWVfcGt0KHBrdCk7Cj4+
IC0JfQo+PiArCQl0b3RhbF9sZW4gKz0gcGt0LT5sZW47Cj4gUGxlYXNlIGluY3JlbWVudCB0b3Rh
bF9sZW4gYmVmb3JlIHZpcnRpb190cmFuc3BvcnRfZnJlZV9wa3QocGt0KSB0bwo+IGF2b2lkIHVz
ZS1hZnRlci1mcmVlLgoKClJpZ2h0LCBsZXQgbWUgZml4IHRoaXMuCgpUaGFua3MKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
