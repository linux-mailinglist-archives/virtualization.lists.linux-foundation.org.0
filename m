Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 12081227619
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 04:52:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 882AC867E5;
	Tue, 21 Jul 2020 02:52:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oXIOw6y-rUvz; Tue, 21 Jul 2020 02:52:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A507186783;
	Tue, 21 Jul 2020 02:52:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C2E7C016F;
	Tue, 21 Jul 2020 02:52:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5670C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 02:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CC302877E3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 02:52:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FGjJzcEddhrt
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 02:52:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7C57887A2D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 02:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595299927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVfhEPEFhV0AVMrKjgxaKndxZmacnTOsvGyzEG28+sU=;
 b=VXCpfQRS0xoSO5WggZv2iyu+jLaL9js9c/h6uSFqCWoZ6G/n7VF1TmPuJphfukXOa5ApzU
 OSoIWhiTG0hMDhebi/tjgzGExMfeCFcxRLTyTjncMGpWSFDWMlkFUF2C5FmU4mp9Rm274y
 1wdM/mT3ZBZTiX3xZ2nnvx0pUR+EFiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-HQQh50hVOI2WstCvI9GlYA-1; Mon, 20 Jul 2020 22:52:03 -0400
X-MC-Unique: HQQh50hVOI2WstCvI9GlYA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F53C107ACCA;
 Tue, 21 Jul 2020 02:52:01 +0000 (UTC)
Received: from [10.72.13.146] (ovpn-13-146.pek2.redhat.com [10.72.13.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA88373FCF;
 Tue, 21 Jul 2020 02:51:45 +0000 (UTC)
Subject: Re: [PATCH V2 3/6] vDPA: implement IRQ offloading helpers in vDPA core
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, mst@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com,
 sean.j.christopherson@intel.com, wanpengli@tencent.com
References: <1594898629-18790-1-git-send-email-lingshan.zhu@intel.com>
 <1594898629-18790-4-git-send-email-lingshan.zhu@intel.com>
 <ab4644cc-9668-a909-4dea-5416aacf7221@redhat.com>
 <45b2cc93-6ae1-47c7-aae6-01afdab1094b@intel.com>
 <625c08af-a81f-d834-bb41-538c3dc9acb4@redhat.com>
 <8c9adead-d3a0-374e-e817-3cb5a44c4bda@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8d12231e-aabe-317e-0afb-d680b866304b@redhat.com>
Date: Tue, 21 Jul 2020 10:51:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8c9adead-d3a0-374e-e817-3cb5a44c4bda@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNy8yMSDkuIrljYgxMDowMiwgWmh1LCBMaW5nc2hhbiB3cm90ZToKPgo+Cj4gT24g
Ny8yMC8yMDIwIDU6NDAgUE0sIEphc29uIFdhbmcgd3JvdGU6Cj4+Cj4+IE9uIDIwMjAvNy8yMCDk
uIvljYg1OjA3LCBaaHUsIExpbmdzaGFuIHdyb3RlOgo+Pj4+Pgo+Pj4+PiArfQo+Pj4+PiArCj4+
Pj4+ICtzdGF0aWMgdm9pZCB2ZHBhX3Vuc2V0dXBfaXJxKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRl
diwgaW50IHFpZCkKPj4+Pj4gK3sKPj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgdmRwYV9kcml2ZXIgKmRy
diA9IGRydl90b192ZHBhKHZkZXYtPmRldi5kcml2ZXIpOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAg
aWYgKGRydi0+dW5zZXR1cF92cV9pcnEpCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkcnYtPnVuc2V0
dXBfdnFfaXJxKHZkZXYsIHFpZCk7Cj4+Pj4KPj4+Pgo+Pj4+IERvIHlvdSBuZWVkIHRvIGNoZWNr
IHRoZSBleGlzdGVuY2Ugb2YgZHJ2IGJlZm9yZSBjYWxsaW5nIAo+Pj4+IHVuc2V0X3ZxX2lycSgp
Pwo+Pj4gWWVzLCB3ZSBzaG91bGQgY2hlY2sgdGhpcyB3aGVuIHdlIHRha2UgdGhlIHJlbGVhc2lu
ZyBwYXRoIGludG8gYWNjb3VudC4KPj4+Pgo+Pj4+IEFuZCBob3cgY2FuIHRoaXMgc3luY2hyb25p
emUgd2l0aCBkcml2ZXIgcmVsZWFzaW5nIGFuZCBiaW5kaW5nPwo+Pj4gV2lsbCBhZGQgYW4gdmRw
YV91bnNldHVwX2lycSgpIGNhbGwgaW4gdmhzb3RfdmRwYV9yZWxlYXNlKCkuCj4+PiBGb3IgYmlu
ZGluZywgSSB0aGluayBpdCBpcyBhIG5ldyBkZXYgYm91bmQgdG8gdGhlIHRoZSBkcml2ZXIsCj4+
PiBpdCBzaG91bGQgZ28gdGhyb3VnaCB0aGUgdmRwYV9zZXR1cF9pcnEoKSByb3V0aW5lLiBvciBp
ZiBpdCBpcwo+Pj4gYSBkZXZpY2UgcmUtYmluZCB0byB2aG9zdF92ZHBhLCBJIHRoaW5rIHdlIGhh
dmUgY2xlYW5lZCB1cAo+Pj4gaXJxX2J5cGFzc19wcm9kdWNlciBmb3IgaXQgYXMgd2Ugd291bGQg
Y2FsbCB2aGRwYV91bnNldHVwX2lycSgpCj4+PiBpbiB0aGUgcmVsZWFzZSBmdW5jdGlvbi4KPj4K
Pj4KPj4gSSBtZWFudCBjYW4gdGhlIGZvbGxvd2luZyB0aGluZ3MgaGFwcGVuPwo+Pgo+PiAxKSBz
b21lIHZEUEEgZGV2aWNlIGRyaXZlciBwcm9iZSB0aGUgaGFyZHdhcmUgYW5kIGNhbGwgCj4+IHZk
cGFfcmVxdWVzdF9pcnEoKSBpbiBpdHMgUENJIHByb2JlIGZ1bmN0aW9uLgo+PiAyKSB2RFBBIGRl
dmljZSBpcyBwcm9iZWQgYnkgdmhvc3QtdkRQQQo+Pgo+PiBUaGVuIGlycSBieXBhc3MgY2FuJ3Qg
d29yayBzaW5jZSB3ZSB3aGVuIHZkcGFfdW5zZXR1cF9pcnEoKSBpcyAKPj4gY2FsbGVkLCB0aGVy
ZSdzIG5vIGRyaXZlciBib3VuZC4gT3IgaXMgdGhlcmUgYSByZXF1aXJlbWVudCB0aGF0IAo+PiB2
ZGFwX3JlcXVlc3QvZnJlZV9pcnEoKSBtdXN0IGJlIGNhbGxlZCBzb21ld2hlcmUgKGUuZyBpbiB0
aGUgCj4+IHNldF9zdGF0dXMgYnVzIG9wZXJhdGlvbnMpPyBJZiB5ZXMsIHdlIG5lZWQgZG9jdW1l
bnQgdGhvc2UgcmVxdWlyZW1lbnRzLgo+IHZkcGFfdW5zZXVwX2lycSBpcyBvbmx5IGNhbGxlZCB3
aGVuIHdlIHdhbnQgdG8gdW5yZWdpc3RlciB0aGUgcHJvZHVjZXIsCgoKVHlwbywgSSBtZWFudCB2
ZHBhX3NldHVwX2lycSgpLgoKVGhhbmtzCgoKPiAgIG5vdyB3ZSBoYXZlIHR3byBjb2RlIHBhdGgg
dXNpbmcgaXQ6IGZyZWVfaXJxIGFuZCByZWxhYXNlKCkuIEkgYWdyZWUgd2UgY2FuIGRvY3VtZW50
IHRoaXMgcmVxdWlyZW1lbnRzIGZvciB0aGUgaGVscGVycywgdGhlc2UgZnVuY3Rpb25zIGNhbiBv
bmx5IGJlIGNhbGxlZCB0aHJvdWdoIHN0YXR1cyBjaGFuZ2VzKERSSVZFUl9PSyBhbmQgIURSSVZF
Ul9PSykuCj4KPiBUaGFua3MsCj4gQlIKPiBaaHUgTGluZ3NoYW4KPj4KPj4gVGhhbmtzCj4+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
