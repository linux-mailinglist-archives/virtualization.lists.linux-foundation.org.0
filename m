Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 395BF1D06BB
	for <lists.virtualization@lfdr.de>; Wed, 13 May 2020 07:57:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3EE9F20455;
	Wed, 13 May 2020 05:57:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d6+vTKq-vs4p; Wed, 13 May 2020 05:57:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 70A642043F;
	Wed, 13 May 2020 05:57:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53B66C016F;
	Wed, 13 May 2020 05:57:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F66EC016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 05:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 18F0986981
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 05:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GDx5sZiYFnoE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 05:57:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2024187D6C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 05:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589349453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oS9s06FImqWmW3Ha3Sx3lNv173yHCer4HwNEWY7z8Lw=;
 b=A65PPSpXo6wkymPTMbSzVCOjkTAScE3Kn/2REO4bEmbMLEGQrDgTJve5g8wavyIAveswuH
 1W04B/NDyavO76cPeGkzmnJf/AWb3HyEDK78eW/z/N34fmx5W0SIcSLyXp3CFaRjtY25F/
 bQgmj3tybBafmhCypbMAxxJrzjxhQYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-pMwZ543xOua3WL8Aq33VRw-1; Wed, 13 May 2020 01:57:29 -0400
X-MC-Unique: pMwZ543xOua3WL8Aq33VRw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90DC21841931;
 Wed, 13 May 2020 05:57:28 +0000 (UTC)
Received: from [10.72.13.188] (ovpn-13-188.pek2.redhat.com [10.72.13.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E36F05D9E8;
 Wed, 13 May 2020 05:57:20 +0000 (UTC)
Subject: Re: [PATCH V2] ifcvf: move IRQ request/free to status change handlers
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, mst@redhat.com,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <1589270444-3669-1-git-send-email-lingshan.zhu@intel.com>
 <8aca85c3-3bf6-a1ec-7009-cd9a635647d7@redhat.com>
 <5bbe0c21-8638-45e4-04e8-02ad0df44b38@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f7485579-834f-1770-1622-e6df1b2f3e81@redhat.com>
Date: Wed, 13 May 2020 13:57:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5bbe0c21-8638-45e4-04e8-02ad0df44b38@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: lulu@redhat.com
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

Ck9uIDIwMjAvNS8xMyDkuIvljYgxMjo0MiwgWmh1LCBMaW5nc2hhbiB3cm90ZToKPgo+Cj4gT24g
NS8xMy8yMDIwIDEyOjEyIFBNLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pgo+PiBPbiAyMDIwLzUvMTIg
5LiL5Y2INDowMCwgWmh1IExpbmdzaGFuIHdyb3RlOgo+Pj4gVGhpcyBjb21taXQgbW92ZSBJUlEg
cmVxdWVzdCBhbmQgZnJlZSBvcGVyYXRpb25zIGZyb20gcHJvYmUoKQo+Pj4gdG8gVklSVElPIHN0
YXR1cyBjaGFuZ2UgaGFuZGxlciB0byBjb21wbHkgd2l0aCBWSVJUSU8gc3BlYy4KPj4+Cj4+PiBW
SVJUSU8gc3BlYyAxLjEsIHNlY3Rpb24gMi4xLjIgRGV2aWNlIFJlcXVpcmVtZW50czogRGV2aWNl
IFN0YXR1cyBGaWVsZAo+Pj4gVGhlIGRldmljZSBNVVNUIE5PVCBjb25zdW1lIGJ1ZmZlcnMgb3Ig
c2VuZCBhbnkgdXNlZCBidWZmZXIKPj4+IG5vdGlmaWNhdGlvbnMgdG8gdGhlIGRyaXZlciBiZWZv
cmUgRFJJVkVSX09LLgo+Pgo+Pgo+PiBUaGlzIGNvbW1lbnQgbmVlZHMgdG8gYmUgY2hlY2tlZCBh
cyBJIHNhaWQgcHJldmlvdXNseS4gSXQncyBvbmx5IAo+PiBuZWVkZWQgaWYgd2UncmUgc3VyZSBp
ZmN2ZiBjYW4gZ2VuZXJhdGUgaW50ZXJydXB0IGJlZm9yZSBEUklWRVJfT0suCj4+Cj4+Cj4+Pgo+
Pj4gU2lnbmVkLW9mZi1ieTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPgo+
Pj4gLS0tCj4+PiBjaGFuZ2VzIGZyb20gVjE6Cj4+PiByZW1vdmUgaWZjdmZfc3RvcF9kYXRhcGF0
aCgpIGluIHN0YXR1cyA9PSAwIGhhbmRsZXIsIHdlIGRvbid0IG5lZWQgCj4+PiB0byBkbyB0aGlz
Cj4+PiB0d2ljZTsgaGFuZGxlIHN0YXR1cyA9PSAwIGFmdGVyIERSSVZFUl9PSyAtPiAhRFJJVkVS
X09LIGhhbmRsZXIgCj4+PiAoSmFzb24gV2FuZykKPj4KPj4KPj4gUGF0Y2ggbG9va3MgZ29vZCB0
byBtZSwgYnV0IHdpdGggdGhpcyBwYXRjaCBwaW5nIGNhbm5vdCB3b3JrIG9uIG15IAo+PiBtYWNo
aW5lLiAoSXQgd29ya3Mgd2l0aG91dCB0aGlzIHBhdGNoKS4KPj4KPj4gVGhhbmtzCj4gVGhpcyBp
cyBzdHJhbmdlLCBpdCB3b3JrcyBvbiBteSBtYWNoaW5lcywgbGV0J3MgaGF2ZSBhIGNoZWNrIG9m
ZmxpbmUuCj4KPiBUaGFua3MsCj4gQlIKPiBaaHUgTGluZ3NoYW4KCgpOb3RlIHRoYXQgSSB0ZXN0
ZWQgdGhlIHBhdGNoIHdpdGggdmhvc3QtdnBkYS4KClRoYW5rcy4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
