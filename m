Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3091B8D8B
	for <lists.virtualization@lfdr.de>; Sun, 26 Apr 2020 09:39:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5FF2C86356;
	Sun, 26 Apr 2020 07:39:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y376QxdNB5sm; Sun, 26 Apr 2020 07:39:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 68ECE8628A;
	Sun, 26 Apr 2020 07:39:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45EE8C0172;
	Sun, 26 Apr 2020 07:39:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F047C0172
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 07:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7B59D87ADB
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 07:39:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZBFiJcX+SX2R
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 07:39:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5717C87ACE
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 07:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587886738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vop1t3sjK9amtXfGYvpa+yLGCJ32ZxdBV2IWmBKObrI=;
 b=Ctu0ANVfJq59rA7cSGUn8iXYfL5IlDpdJSZcliIfiUctoVK0utI3jQtINa4EQRXvOkMW/8
 ChucMRziEgNEwVQ8tcaTgiMXmueKr4ox+47bK2gYchD6jutKot4HHZ6eM6eKjJgxEi65DB
 1uZaSolo6ND/J0MLfYcob5lKRbq5Bbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-gqr-8FTQPiaXw8kYIrJ86A-1; Sun, 26 Apr 2020 03:38:52 -0400
X-MC-Unique: gqr-8FTQPiaXw8kYIrJ86A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E2D6872FE0;
 Sun, 26 Apr 2020 07:38:50 +0000 (UTC)
Received: from [10.72.13.103] (ovpn-13-103.pek2.redhat.com [10.72.13.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FAA960300;
 Sun, 26 Apr 2020 07:38:43 +0000 (UTC)
Subject: Re: [PATCH V2 1/2] vdpa: Support config interrupt in vhost_vdpa
To: Zhu Lingshan <lingshan.zhu@linux.intel.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <1587881384-2133-1-git-send-email-lingshan.zhu@intel.com>
 <1587881384-2133-2-git-send-email-lingshan.zhu@intel.com>
 <055fb826-895d-881b-719c-228d0cc9a7bf@redhat.com>
 <e345cc85-aa9d-1173-8308-f0a301fca2b2@redhat.com>
 <fb51aa36-9a58-fd50-a4fa-4cc887357367@linux.intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b34df002-344c-f011-dce0-fee882f62af2@redhat.com>
Date: Sun, 26 Apr 2020 15:38:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <fb51aa36-9a58-fd50-a4fa-4cc887357367@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Ck9uIDIwMjAvNC8yNiDkuIvljYgzOjI0LCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4KPgo+IE9uIDQv
MjYvMjAyMCAzOjAzIFBNLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pgo+PiBPbiAyMDIwLzQvMjYg5LiL
5Y2IMjo1OCwgSmFzb24gV2FuZyB3cm90ZToKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3Zob3N0L3Zob3N0LmggYi9kcml2ZXJzL3Zob3N0L3Zob3N0LmgKPj4+PiBpbmRleCAxODEzODIx
Li44NjYzMTM5IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuaAo+Pj4+ICsr
KyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuaAo+Pj4+IEBAIC0xOCw2ICsxOCw4IEBACj4+Pj4gwqAg
dHlwZWRlZiB2b2lkICgqdmhvc3Rfd29ya19mbl90KShzdHJ1Y3Qgdmhvc3Rfd29yayAqd29yayk7
Cj4+Pj4gwqAgwqAgI2RlZmluZSBWSE9TVF9XT1JLX1FVRVVFRCAxCj4+Pj4gKyNkZWZpbmUgVkhP
U1RfRklMRV9VTkJJTkQgLTEKPj4+Cj4+Pgo+Pj4gSSB0aGluayBpdCdzIGJldHRlciB0byBkb2N1
bWVudCB0aGlzIGluIHVhcGkuIAo+Pgo+Pgo+PiBJIG1lYW50IGUuZyBpbiB2aG9zdF92cmluZ19m
aWxlLCB3ZSBoYWQgYSBjb21tZW50IG9mIHVuYmluZGluZzoKPj4KPj4gc3RydWN0IHZob3N0X3Zy
aW5nX2ZpbGUgewo+PiDCoMKgwqAgdW5zaWduZWQgaW50IGluZGV4Owo+PiDCoMKgwqAgaW50IGZk
OyAvKiBQYXNzIC0xIHRvIHVuYmluZCBmcm9tIGZpbGUuICovCj4+Cj4+IH07Cj4gSSB0aGluayBp
dCBpcyBiZXR0ZXIgdG8gdXNlIGFuIGludCBmZCB0aGFuIHZob3N0X3ZyaW5nX2ZpbGUsIHRvIGF2
b2lkIHRoZSBjb25mdXNpb25zLAo+IHNvIGlmIHdlIGFkZCNkZWZpbmUgVkhPU1RfRklMRV9VTkJJ
TkQgLTEgaW4gdGhlIHVhcGkgaGVhZGVyLCBjYW4gaXQgZG9jdW1lbnQgaXRzZWxmPwo+IFRoYW5r
cwoKCkkgdGhpbmsgc28uCgpUaGFua3MKCgo+Pgo+PiBUaGFua3MKPj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
