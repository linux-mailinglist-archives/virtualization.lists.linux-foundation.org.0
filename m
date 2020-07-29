Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C25231CAA
	for <lists.virtualization@lfdr.de>; Wed, 29 Jul 2020 12:27:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A0BE286762;
	Wed, 29 Jul 2020 10:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZE2+mktGo467; Wed, 29 Jul 2020 10:27:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3B9FD86759;
	Wed, 29 Jul 2020 10:27:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E360C004D;
	Wed, 29 Jul 2020 10:27:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40877C004D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 10:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2EF038753F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 10:27:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a1ZtVEEZIVpH
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 10:27:03 +0000 (UTC)
X-Greylist: delayed 00:06:55 by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0FE7A8217F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 10:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596018421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oVRnlPXyWQwKHwi0fgXED1x7wx9OCCFOxUXZea3A4uU=;
 b=eZKZpGfmtou3TZlZ2NLrx9J2w9QLN13hTj3ZHV0YxuNz6ZgOCCQa7l7L/qDDd0atyX5F2g
 YqsLXpUGekmLoAFFkWVhefhnugElQS8KFd95zh6iNLXaaGjizf9x2OJeAXJitSk9+p+jWx
 tucQfMShjXlbuMxd61+OxXi6EPkUzNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-B2P_4DiFNnCzp-B3JwtHfw-1; Wed, 29 Jul 2020 06:20:05 -0400
X-MC-Unique: B2P_4DiFNnCzp-B3JwtHfw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCF508015F4;
 Wed, 29 Jul 2020 10:20:03 +0000 (UTC)
Received: from [10.72.13.120] (ovpn-13-120.pek2.redhat.com [10.72.13.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16252712FF;
 Wed, 29 Jul 2020 10:19:53 +0000 (UTC)
Subject: Re: [PATCH V4 4/6] vhost_vdpa: implement IRQ offloading in vhost_vdpa
To: Eli Cohen <eli@mellanox.com>
References: <20200728042405.17579-1-lingshan.zhu@intel.com>
 <20200728042405.17579-5-lingshan.zhu@intel.com>
 <20200728090438.GA21875@nps-server-21.mtl.labs.mlnx>
 <c87d4a5a-3106-caf2-2bc1-764677218967@redhat.com>
 <20200729095503.GD35280@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <45b7e8aa-47a9-06f6-6b72-762d504adb00@redhat.com>
Date: Wed, 29 Jul 2020 18:19:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729095503.GD35280@mtl-vdi-166.wap.labs.mlnx>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: shahafs@mellanox.com, wanpengli@tencent.com, parav@mellanox.com,
 kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 sean.j.christopherson@intel.com, virtualization@lists.linux-foundation.org,
 pbonzini@redhat.com, Zhu Lingshan <lingshan.zhu@intel.com>
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

Ck9uIDIwMjAvNy8yOSDkuIvljYg1OjU1LCBFbGkgQ29oZW4gd3JvdGU6Cj4gT24gV2VkLCBKdWwg
MjksIDIwMjAgYXQgMDU6MjE6NTNQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4gT24gMjAy
MC83LzI4IOS4i+WNiDU6MDQsIEVsaSBDb2hlbiB3cm90ZToKPj4+IE9uIFR1ZSwgSnVsIDI4LCAy
MDIwIGF0IDEyOjI0OjAzUE0gKzA4MDAsIFpodSBMaW5nc2hhbiB3cm90ZToKPj4+PiArc3RhdGlj
IHZvaWQgdmhvc3RfdmRwYV9zZXR1cF92cV9pcnEoc3RydWN0IHZob3N0X3ZkcGEgKnYsIGludCBx
aWQpCj4+Pj4gK3sKPj4+PiArCXN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxID0gJnYtPnZxc1tx
aWRdOwo+Pj4+ICsJY29uc3Qgc3RydWN0IHZkcGFfY29uZmlnX29wcyAqb3BzID0gdi0+dmRwYS0+
Y29uZmlnOwo+Pj4+ICsJc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhID0gdi0+dmRwYTsKPj4+PiAr
CWludCByZXQsIGlycTsKPj4+PiArCj4+Pj4gKwlzcGluX2xvY2soJnZxLT5jYWxsX2N0eC5jdHhf
bG9jayk7Cj4+Pj4gKwlpcnEgPSBvcHMtPmdldF92cV9pcnEodmRwYSwgcWlkKTsKPj4+PiArCWlm
ICghdnEtPmNhbGxfY3R4LmN0eCB8fCBpcnEgPT0gLUVJTlZBTCkgewo+Pj4+ICsJCXNwaW5fdW5s
b2NrKCZ2cS0+Y2FsbF9jdHguY3R4X2xvY2spOwo+Pj4+ICsJCXJldHVybjsKPj4+PiArCX0KPj4+
PiArCj4+PiBJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCB0aGlzIHdpbGwgY2F1c2UgdGhlc2Ug
SVJRcyB0byBiZSBmb3J3YXJkZWQKPj4+IGRpcmVjdGx5IHRvIHRoZSBWQ1BVLCBlLmcuIHdpbGwg
YmUgaGFuZGxlZCBieSB0aGUgZ3Vlc3QvcWVtdS4KPj4KPj4gWWVzLCBpZiBpdCBjYW4gYnlwYXNz
ZWQsIHRoZSBpbnRlcnJ1cHQgd2lsbCBiZSBkZWxpdmVyZWQgdG8gdkNQVSBkaXJlY3RseS4KPj4K
PiBTbywgdXN1YWxseSB0aGUgbmV0d29yayBkcml2ZXIga25vd3MgaG93IHRvIGhhbmRsZSBpbnRl
cnJ1cHMgZm9yIGl0cwo+IGRldmljZXMuIEkgYXNzdW1lIHRoZSB2aXJ0aW9fbmV0IGRyaXZlciBh
dCB0aGUgZ3Vlc3QgaGFzIHNvbWUgZGVmYXVsdAo+IHByb2Nlc3NpbmcgYnV0IHdoYXQgaWYgdGhl
IHVuZGVybHlpbmcgaGFyZHdhcmUgZGV2aWNlIChzdWNoIGFzIHRoZSBjYXNlCj4gb2YgdmRwYSkg
bmVlZHMgdG8gdGFrZSBzb21lIGFjdGlvbnM/CgoKVmlydGlvIHNwbGl0cyB0aGUgYnVzIG9wZXJh
dGlvbnMgb3V0IG9mIGRldmljZSBvcGVyYXRpb25zLiBTbyBkaWQgdGhlIApkcml2ZXIuCgpUaGUg
dmlydGlvLW5ldCBkcml2ZXIgZGVwZW5kcyBvbiBhIHRyYW5zcG9ydCBkcml2ZXIgdG8gdGFsayB0
byB0aGUgcmVhbCAKZGV2aWNlLiBVc3VhbGx5IFBDSSBpcyB1c2VkIGFzIHRoZSB0cmFuc3BvcnQg
Zm9yIHRoZSBkZXZpY2UuIEluIHRoaXMgCmNhc2UgdmlydGlvLXBjaSBkcml2ZXIgaXMgaW4gY2hh
cmdlIG9mIGRlYWxpbmcgd2l0aCBpcnEgCmFsbG9jYXRpb24vZnJlZS9jb25maWd1cmF0aW9uIGFu
ZCBpdCBuZWVkcyB0byBjby1vcGVyYXRlIHdpdGggcGxhdGZvcm0gCnNwZWNpZmljIGlycWNoaXAg
KHZpcnR1YWxpemVkIGJ5IEtWTSkgdG8gZmluaXNoIHRoZSB3b3JrIGxpa2UgaXJxIAphY2tub3ds
ZWRnZSBldGMuwqAgRS5nIGZvciB4ODYsIHRoZSBpcnEgb2ZmbG9hZGluZyBjYW4gb25seSB3b3Jr
IHdoZW4gCnRoZXJlJ3MgYSBoYXJkd2FyZSBzdXBwb3J0IG9mIHZpcnR1YWwgaXJxY2hpcCAoQVBJ
Q3YpIHRoZW4gYWxsIHN0dWZmcyAKY291bGQgYmUgZG9uZSB3aXRob3V0IHZtZXhpdHMuCgpTbyBu
byB2ZW5kb3Igc3BlY2lmaWMgcGFydCBzaW5jZSB0aGUgZGV2aWNlIGFuZCB0cmFuc3BvcnQgYXJl
IGFsbCBzdGFuZGFyZC4KCgo+ICAgSXMgdGhlcmUgYW4gb3B0aW9uIHRvIGRvIGJvdW5jZSB0aGUK
PiBpbnRlcnJ1cHQgYmFjayB0byB0aGUgdmVuZG9yIHNwZWNpZmljIGRyaXZlciBpbiB0aGUgaG9z
dCBzbyBpdCBjYW4gdGFrZQo+IHRoZXNlIGFjdGlvbnM/CgoKQ3VycmVudGx5IG5vdCwgYnV0IGV2
ZW4gaWYgd2UgY2FuIGRvIHRoaXMsIEknbSBhZnJhaWQgd2Ugd2lsbCBsb3NlIHRoZSAKcGVyZm9y
bWFuY2UgYWR2YW50YWdlIG9mIGlycSBieXBhc3NpbmcuCgoKPgo+Pj4gRG9lcyB0aGlzIG1lYW4g
dGhhdCB0aGUgaG9zdCB3aWxsIG5vdCBoYW5kbGUgdGhpcyBpbnRlcnJ1cHQ/IEhvdyBkb2VzIGl0
Cj4+PiB3b3JrIGluIGNhc2Ugb24gbGV2ZWwgdHJpZ2dlcmVkIGludGVycnVwdHM/Cj4+Cj4+IFRo
ZXJlJ3Mgbm8gZ3VhcmFudGVlIHRoYXQgdGhlIEtWTSBhcmNoIGNvZGUgY2FuIG1ha2Ugc3VyZSB0
aGUgaXJxCj4+IGJ5cGFzcyB3b3JrIGZvciBhbnkgdHlwZSBvZiBpcnEuIFNvIGlmIHRoZXkgdGhl
IGlycSB3aWxsIHN0aWxsIG5lZWQKPj4gdG8gYmUgaGFuZGxlZCBieSBob3N0IGZpcnN0LiBUaGlz
IG1lYW5zIHdlIHNob3VsZCBrZWVwIHRoZSBob3N0Cj4+IGludGVycnVwdCBoYW5kbGVyIGFzIGEg
c2xvd3BhdGggKGZhbGxiYWNrKS4KPj4KPj4+IEluIHRoZSBjYXNlIG9mIENvbm5lY3RYLCBJIG5l
ZWQgdG8gZXhlY3V0ZSBzb21lIGNvZGUgdG8gYWNrbm93bGVkZ2UgdGhlCj4+PiBpbnRlcnJ1cHQu
Cj4+Cj4+IFRoaXMgdHVybnMgb3V0IHRvIGJlIGhhcmQgZm9yIGlycSBieXBhc3NpbmcgdG8gd29y
ay4gSXMgaXQgYmVjYXVzZQo+PiB0aGUgaXJxIGlzIHNoYXJlZCBvciB3aGF0IGtpbmQgb2YgYWNr
IHlvdSBuZWVkIHRvIGRvPwo+IEkgaGF2ZSBhbiBFUSB3aGljaCBpcyBhIHF1ZXVlIGZvciBldmVu
dHMgY29tbWluZyBmcm9tIHRoZSBoYXJkd2FyZS4gVGhpcwo+IEVRIGNhbiBjcmVhdGVkIHNvIGl0
IHJlcG9ydHMgb25seSBjb21wbGV0aW9uIGV2ZW50cyBidXQgSSBzdGlsbCBuZWVkIHRvCj4gZXhl
Y3V0ZSBjb2RlIHRoYXQgcm91Z2hseSB0ZWxscyB0aGUgZGV2aWNlIHRoYXQgSSBzYXcgdGhlc2Ug
ZXZlbnQKPiByZWNvcmRzIGFuZCB0aGVuIGFybSBpdCBhZ2FpbiBzbyBpdCBjYW4gcmVwb3J0IG1v
cmUgaW50ZXJydXB0cyAoZS5nIGlmCj4gbW9yZSBwYWNrZXRzIGFyZSByZWNlaXZlZCBvciBzZW50
KS4gVGhpcyBpcyBkZXZpY2Ugc3BlY2lmaWMgY29kZS4KCgpBbnkgY2hhbmNlIHRoYXQgdGhlIGhh
cmR3YXJlIGNhbiB1c2UgTVNJICh3aGljaCBpcyBub3QgdGhlIGNhc2UgaGVyZSk/CgpUaGFua3MK
Cgo+PiBUaGFua3MKPj4KPj4KPj4+IENhbiB5b3UgZXhwbGFpbiBob3cgdGhpcyBzaG91bGQgYmUg
ZG9uZT8KPj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4v
bGlzdGluZm8vdmlydHVhbGl6YXRpb24=
