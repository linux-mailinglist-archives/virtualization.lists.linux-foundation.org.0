Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDB9C0132
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 10:31:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9D8EBFA2;
	Fri, 27 Sep 2019 08:31:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 785B1F85
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 08:31:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 22C4D8A0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 08:31:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 770658535D;
	Fri, 27 Sep 2019 08:31:44 +0000 (UTC)
Received: from [10.72.12.30] (ovpn-12-30.pek2.redhat.com [10.72.12.30])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F9095C3FA;
	Fri, 27 Sep 2019 08:31:33 +0000 (UTC)
Subject: Re: [PATCH] vhost: introduce mdev based hardware backend
To: Tiwei Bie <tiwei.bie@intel.com>
References: <20190926045427.4973-1-tiwei.bie@intel.com>
	<1b4b8891-8c14-1c85-1d6a-2eed1c90bcde@redhat.com>
	<20190927045438.GA17152@___>
	<49bb0777-3761-3737-8e5b-568957f9a935@redhat.com>
	<20190927080410.GA22568@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cc288a52-dc5e-1a59-6219-8835c898ea73@redhat.com>
Date: Fri, 27 Sep 2019 16:31:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927080410.GA22568@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 27 Sep 2019 08:31:44 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, maxime.coquelin@redhat.com, lingshan.zhu@intel.com
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

Ck9uIDIwMTkvOS8yNyDkuIvljYg0OjA0LCBUaXdlaSBCaWUgd3JvdGU6Cj4gT24gRnJpLCBTZXAg
MjcsIDIwMTkgYXQgMDM6MTQ6NDJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4gT24gMjAx
OS85LzI3IOS4i+WNiDEyOjU0LCBUaXdlaSBCaWUgd3JvdGU6Cj4+Pj4+ICsKPj4+Pj4gKwkJLyoK
Pj4+Pj4gKwkJICogSW4gdmhvc3QtbWRldiwgdXNlcnNwYWNlIHNob3VsZCBwYXNzIHJpbmcgYWRk
cmVzc2VzCj4+Pj4+ICsJCSAqIGluIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3NlcyB3aGVuIElPTU1V
IGlzIGRpc2FibGVkIG9yCj4+Pj4+ICsJCSAqIElPVkFzIHdoZW4gSU9NTVUgaXMgZW5hYmxlZC4K
Pj4+Pj4gKwkJICovCj4+Pj4gQSBxdWVzdGlvbiBoZXJlLCBjb25zaWRlciB3ZSdyZSB1c2luZyBu
b2lvbW11IG1vZGUuIElmIGd1ZXN0IHBoeXNpY2FsCj4+Pj4gYWRkcmVzcyBpcyBwYXNzZWQgaGVy
ZSwgaG93IGNhbiBhIGRldmljZSB1c2UgdGhhdD8KPj4+Pgo+Pj4+IEkgYmVsaWV2ZSB5b3UgbWVh
bnQgImhvc3QgcGh5c2ljYWwgYWRkcmVzcyIgaGVyZT8gQW5kIGl0IGFsc28gaGF2ZSB0aGUKPj4+
PiBpbXBsaWNhdGlvbiB0aGF0IHRoZSBIUEEgc2hvdWxkIGJlIGNvbnRpbnVvdXMgKGUuZyB1c2lu
ZyBodWdldGxiZnMpLgo+Pj4gVGhlIGNvbW1lbnQgaXMgdGFsa2luZyBhYm91dCB0aGUgdmlydHVh
bCBJT01NVSAoaS5lLiBpb3RsYiBpbiB2aG9zdCkuCj4+PiBJdCBzaG91bGQgYmUgcmVwaHJhc2Vk
IHRvIGNvdmVyIHRoZSBub2lvbW11IGNhc2UgYXMgd2VsbC4gVGhhbmtzIGZvcgo+Pj4gc3BvdHRp
bmcgdGhpcy4KPj4KPj4gU28gdGhlIHF1ZXN0aW9uIHN0aWxsLCBpZiBHUEEgaXMgcGFzc2VkIGhv
dyBjYW4gaXQgYmUgdXNlZCBieSB0aGUKPj4gdmlydGlvLW1kZXYgZGV2aWNlPwo+IFNvcnJ5IGlm
IEkgZGlkbid0IG1ha2UgaXQgY2xlYXIuLgo+IE9mIGNvdXJzZSwgR1BBIGNhbid0IGJlIHBhc3Nl
ZCBpbiBub2lvbW11IG1vZGUuCgoKSSBzZWUuCgpUaGFua3MgZm9yIHRoZSBjb25maXJtYXRpb24u
CgoKPgo+Cj4+IFRoYW5rcwo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
