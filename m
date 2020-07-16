Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B4B221B30
	for <lists.virtualization@lfdr.de>; Thu, 16 Jul 2020 06:20:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 24878899F6;
	Thu, 16 Jul 2020 04:20:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vXLnnL7D101F; Thu, 16 Jul 2020 04:20:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6AA0E8B0B4;
	Thu, 16 Jul 2020 04:20:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33914C0733;
	Thu, 16 Jul 2020 04:20:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44B14C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 04:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1EB6C20437
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 04:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uBXV7gCJXX1y
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 04:20:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 3F0B420425
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 04:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594873226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NMgT9K8k4h6U8jZfojucjF8UBsRWGKHtNgtyATuyZFk=;
 b=Ucpn2NKD7zzd/idUNilvfLLXE/oFYzpLr+/wlaM7jHKOxcETG8L48PdvaX3NPaCSnNudmi
 RFeA/VmJIg/FjDc90RKSbeGyPEgo83sR3YyhyGq+6/Jv7SWudt2wI5WPXgR95sfOFjzLSc
 ZfvytDZDfuLldIbMeXWfaLxPsomr0pM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-gQeUVn6SPeqxFZab6ULayQ-1; Thu, 16 Jul 2020 00:20:25 -0400
X-MC-Unique: gQeUVn6SPeqxFZab6ULayQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6DF3102C7F3;
 Thu, 16 Jul 2020 04:20:23 +0000 (UTC)
Received: from [10.72.12.131] (ovpn-12-131.pek2.redhat.com [10.72.12.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D9175D9DC;
 Thu, 16 Jul 2020 04:20:10 +0000 (UTC)
Subject: Re: [PATCH 0/7] *** IRQ offloading for vDPA ***
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 alex williamson <alex.williamson@redhat.com>, pbonzini@redhat.com,
 sean.j.christopherson@intel.com, wanpengli@tencent.com
References: <1594565524-3394-1-git-send-email-lingshan.zhu@intel.com>
 <70244d80-08a4-da91-3226-7bfd2019467e@redhat.com>
 <97032c51-3265-c94a-9ce1-f42fcc6d3075@intel.com>
 <77318609-85ef-f169-2a1e-500473976d84@redhat.com>
 <29ab6da8-ed8e-6b91-d658-f3d240543b29@intel.com>
 <1e91d9dd-d787-beff-2c14-9c76ffc3b285@redhat.com>
 <a319cba3-8b3d-8968-0fb7-48a1d34042bf@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <67c4c41d-9e95-2270-4acb-6f04668c34fa@redhat.com>
Date: Thu, 16 Jul 2020 12:20:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a319cba3-8b3d-8968-0fb7-48a1d34042bf@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
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

Ck9uIDIwMjAvNy8xNiDkuIvljYgxMjoxMywgWmh1LCBMaW5nc2hhbiB3cm90ZToKPgo+Cj4gT24g
Ny8xNi8yMDIwIDEyOjAyIFBNLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pgo+PiBPbiAyMDIwLzcvMTYg
5LiK5Y2IMTE6NTksIFpodSwgTGluZ3NoYW4gd3JvdGU6Cj4+Pgo+Pj4gT24gNy8xNi8yMDIwIDEw
OjU5IEFNLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+Cj4+Pj4gT24gMjAyMC83LzE2IOS4iuWNiDk6
MzksIFpodSwgTGluZ3NoYW4gd3JvdGU6Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IE9uIDcvMTUvMjAyMCA5
OjQzIFBNLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+IE9uIDIwMjAvNy8xMiDkuIvl
jYgxMDo1MiwgWmh1IExpbmdzaGFuIHdyb3RlOgo+Pj4+Pj4+IEhpIEFsbCwKPj4+Pj4+Pgo+Pj4+
Pj4+IFRoaXMgc2VyaWVzIGludGVuZHMgdG8gaW1wbGVtZW50IElSUSBvZmZsb2FkaW5nIGZvcgo+
Pj4+Pj4+IHZob3N0X3ZkcGEuCj4+Pj4+Pj4KPj4+Pj4+PiBCeSB0aGUgZmVhdCBvZiBpcnEgZm9y
d2FyZGluZyBmYWNpbGl0aWVzIGxpa2UgcG9zdGVkCj4+Pj4+Pj4gaW50ZXJydXB0IG9uIFg4Niwg
aXJxIGJ5cGFzcyBjYW7CoCBoZWxwIGRlbGl2ZXIKPj4+Pj4+PiBpbnRlcnJ1cHRzIHRvIHZDUFUg
ZGlyZWN0bHkuCj4+Pj4+Pj4KPj4+Pj4+PiB2RFBBIGRldmljZXMgaGF2ZSBkZWRpY2F0ZWQgaGFy
ZHdhcmUgYmFja2VuZHMgbGlrZSBWRklPCj4+Pj4+Pj4gcGFzcy10aHJvdWdoZWQgZGV2aWNlcy4g
U28gaXQgd291bGQgYmUgcG9zc2libGUgdG8gc2V0dXAKPj4+Pj4+PiBpcnEgb2ZmbG9hZGluZyhp
cnEgYnlwYXNzKSBmb3IgdkRQQSBkZXZpY2VzIGFuZCBnYWluCj4+Pj4+Pj4gcGVyZm9ybWFuY2Ug
aW1wcm92ZW1lbnRzLgo+Pj4+Pj4+Cj4+Pj4+Pj4gSW4gbXkgdGVzdGluZywgd2l0aCB0aGlzIGZl
YXR1cmUsIHdlIGNhbiBzYXZlIDAuMW1zCj4+Pj4+Pj4gaW4gYSBwaW5nIGJldHdlZW4gdHdvIFZG
cyBvbiBhdmVyYWdlLgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBIaSBMaW5nc2hhbjoKPj4+Pj4+Cj4+
Pj4+PiBEdXJpbmcgdGhlIHZpcnRpby1uZXR3b3JraW5nIG1lZXRpbmcsIE1pY2hhZWwgc3BvdHMg
dHdvIHBvc3NpYmxlIAo+Pj4+Pj4gaXNzdWVzOgo+Pj4+Pj4KPj4+Pj4+IDEpIGRvIHdlIG5lZWQg
YW4gbmV3IHVBUEkgdG8gc3RvcCB0aGUgaXJxIG9mZmxvYWRpbmc/Cj4+Pj4+PiAyKSBjYW4gaW50
ZXJydXB0IGxvc3QgZHVyaW5nIHRoZSBldmVudGZkIGN0eD8KPj4+Pj4+Cj4+Pj4+PiBGb3IgMSkg
SSB0aGluayB3ZSBwcm9iYWJseSBub3QsIHdlIGNhbiBhbGxvY2F0ZSBhbiBpbmRlcGVuZGVudCAK
Pj4+Pj4+IGV2ZW50ZmQgd2hpY2ggZG9lcyBub3QgbWFwIHRvIE1TSVguIFNvIHRoZSBjb25zdW1l
ciBjYW4ndCBtYXRjaCAKPj4+Pj4+IHRoZSBwcm9kdWNlciBhbmQgd2UgZmFsbGJhY2sgdG8gZXZl
bnRmZCBiYXNlZCBpcnEuCj4+Pj4+IEhpIEphc29uLAo+Pj4+Pgo+Pj4+PiBJIHdvbmRlciB3aHkg
d2UgbmVlZCB0byBzdG9wIGlycSBvZmZsb2FkaW5nLCBidXQgaWYgd2UgbmVlZCB0byBkbyAKPj4+
Pj4gc28sIG1heWJlIGEgbmV3IHVBUEkgd291bGQgYmUgbW9yZSBpbnR1aXRpdmUgdG8gbWUsCj4+
Pj4+IGJ1dCB3aHkgYW5kIHdobyh1c2VyPyBxZW11Pykgc2hhbGwgaW5pdGlhbGl6ZSB0aGlzIHBy
b2Nlc3MsIGJhc2VkIAo+Pj4+PiBvbiB3aGF0IGtpbmRhIG9mIGJhc2lzIHRvIG1ha2UgdGhlIGRl
Y2lzaW9uPwo+Pj4+Cj4+Pj4KPj4+PiBUaGUgcmVhc29uIGlzIHdlIG1heSB3YW50IHRvIGZhbGxi
YWNrIHRvIHNvZnR3YXJlIGRhdGFwYXRoIGZvciBzb21lIAo+Pj4+IHJlYXNvbiAoZS5nIHNvZnR3
YXJlIGFzc2lzdGVkIGxpdmUgbWlncmF0aW9uKS4gSW4gdGhpcyBjYXNlIHdlIG5lZWQgCj4+Pj4g
aW50ZXJjZXB0IGRldmljZSB3cml0ZSB0byB1c2VkIHJpbmcgc28gd2UgY2FuIG5vdCBvZmZsb2Fk
aW5nIAo+Pj4+IHZpcnRxdWV1ZSBpbnRlcnJ1cHQgaW4gdGhpcyBjYXNlLgo+Pj4gc28gYWRkIGEg
VkhPU1RfVkRQQV9TVE9QX0lSUV9PRkZMT0FESU5HPyBUaGVuIGRvIHdlIG5lZWQgYSAKPj4+IFZI
T1NUX1ZEUEFfU1RBUlRfSVJRX09GRkxPQURJTkcsIHRoZW4gbGV0IHVzZXJzcGFjZSBmdWxseSBj
b250cm9sIAo+Pj4gdGhpcz8gT3IgYW55IGJldHRlciBhcHByb2FjaGVzPyAKPj4KPj4KPj4gUHJv
YmFibHkgbm90LCBpdCdzIGFzIHNpbXBsZSBhcyBhbGxvY2F0aW5nIGFub3RoZXIgZXZlbnRmZCAo
YnV0IG5vdCAKPj4gaXJxZmQpLCBhbmQgcGFzcyBpdCB0byB2aG9zdC12ZHBhLiBUaGVuIHRoZSBv
ZmZsb2FkaW5nIGlzIGRpc2FibGVkIAo+PiBzaW5jZSBpdCBkb2Vzbid0IGhhdmUgYSBjb25zdW1l
ci4KPiBPSywgc291bmRzIGxpa2UgUUVNVSB3b3JrLCBubyBuZWVkIHRvIHRha2UgY2FyZSBpbiB0
aGlzIHNlcmllcywgcmlnaHQ/CgoKVGhhdCdzIG15IHVuZGVyc3RhbmRpbmcuCgpUaGFua3MKCgo+
Cj4gVGhhbmtzLAo+IEJSCj4gWmh1IExpbmdzaGFuCj4+Cj4+IFRoYW5rcwo+Pgo+PgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24g
bWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxp
emF0aW9u
