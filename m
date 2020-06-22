Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1FD2032E8
	for <lists.virtualization@lfdr.de>; Mon, 22 Jun 2020 11:07:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AD36B86C6D;
	Mon, 22 Jun 2020 09:07:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yFoReBnY80Ic; Mon, 22 Jun 2020 09:07:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2C90286C25;
	Mon, 22 Jun 2020 09:07:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 079B4C016F;
	Mon, 22 Jun 2020 09:07:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4CBCC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 09:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A007388934
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 09:07:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OlWxtu78DMLt
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 09:07:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F15278888A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 09:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592816864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uYoQXSzwclqSNX+q/yIlo00opb3YPsUI2zyXrlleGws=;
 b=a+2gipN97RSZA8vu7wpp0FwPoezaSoHIiI31gimWp4zYOUvrXIXS5RvEVNHyoKkvaeHR/T
 6t//Hyq2MzjMYkoOJkBNJP7dN+6IADbWosFHFcrOzKGbIT+mahs3GfF3BJZF6QDwn+wgQZ
 wopFP/FHmg03cXlNdTULcW6y2564tZc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-SQJRxOhlMqa4Bpmmejm1fA-1; Mon, 22 Jun 2020 05:07:41 -0400
X-MC-Unique: SQJRxOhlMqa4Bpmmejm1fA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 294EE801503;
 Mon, 22 Jun 2020 09:07:40 +0000 (UTC)
Received: from [10.72.13.194] (ovpn-13-194.pek2.redhat.com [10.72.13.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1D2071664;
 Mon, 22 Jun 2020 09:07:34 +0000 (UTC)
Subject: Re: [PATCH RFC v8 02/11] vhost: use batched get_vq_desc version
To: Eugenio Perez Martin <eperezma@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20200611113404.17810-1-mst@redhat.com>
 <20200611113404.17810-3-mst@redhat.com>
 <20200611152257.GA1798@char.us.oracle.com>
 <CAJaqyWdwXMX0JGhmz6soH2ZLNdaH6HEdpBM8ozZzX9WUu8jGoQ@mail.gmail.com>
 <CAJaqyWdwgy0fmReOgLfL4dAv-E+5k_7z3d9M+vHqt0aO2SmOFg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b6347dad-89e8-61f6-6394-65c301f91dd7@redhat.com>
Date: Mon, 22 Jun 2020 17:07:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAJaqyWdwgy0fmReOgLfL4dAv-E+5k_7z3d9M+vHqt0aO2SmOFg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, kvm list <kvm@vger.kernel.org>,
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

Ck9uIDIwMjAvNi8yMCDkuIrljYgyOjA3LCBFdWdlbmlvIFBlcmV6IE1hcnRpbiB3cm90ZToKPiBP
biBNb24sIEp1biAxNSwgMjAyMCBhdCAyOjI4IFBNIEV1Z2VuaW8gUGVyZXogTWFydGluCj4gPGVw
ZXJlem1hQHJlZGhhdC5jb20+IHdyb3RlOgo+PiBPbiBUaHUsIEp1biAxMSwgMjAyMCBhdCA1OjIy
IFBNIEtvbnJhZCBSemVzenV0ZWsgV2lsawo+PiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4gd3Jv
dGU6Cj4+PiBPbiBUaHUsIEp1biAxMSwgMjAyMCBhdCAwNzozNDoxOUFNIC0wNDAwLCBNaWNoYWVs
IFMuIFRzaXJraW4gd3JvdGU6Cj4+Pj4gQXMgdGVzdGluZyBzaG93cyBubyBwZXJmb3JtYW5jZSBj
aGFuZ2UsIHN3aXRjaCB0byB0aGF0IG5vdy4KPj4+IFdoYXQga2luZCBvZiB0ZXN0aW5nPyAxMDBH
aUI/IExvdyBsYXRlbmN5Pwo+Pj4KPj4gSGkgS29ucmFkLgo+Pgo+PiBJIHRlc3RlZCB0aGlzIHZl
cnNpb24gb2YgdGhlIHBhdGNoOgo+PiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS8xMC8xMy80
Mgo+Pgo+PiBJdCB3YXMgdGVzdGVkIGZvciB0aHJvdWdocHV0IHdpdGggRFBESydzIHRlc3RwbWQg
KGFzIGRlc2NyaWJlZCBpbgo+PiBodHRwOi8vZG9jLmRwZGsub3JnL2d1aWRlcy9ob3d0by92aXJ0
aW9fdXNlcl9hc19leGNlcHRpb25hbF9wYXRoLmh0bWwpCj4+IGFuZCBrZXJuZWwgcGt0Z2VuLiBO
byBsYXRlbmN5IHRlc3RzIHdlcmUgcGVyZm9ybWVkIGJ5IG1lLiBNYXliZSBpdCBpcwo+PiBpbnRl
cmVzdGluZyB0byBwZXJmb3JtIGEgbGF0ZW5jeSB0ZXN0IG9yIGp1c3QgYSBkaWZmZXJlbnQgc2V0
IG9mIHRlc3RzCj4+IG92ZXIgYSByZWNlbnQgdmVyc2lvbi4KPj4KPj4gVGhhbmtzIQo+IEkgaGF2
ZSByZXBlYXRlZCB0aGUgdGVzdHMgd2l0aCB2OSwgYW5kIHJlc3VsdHMgYXJlIGEgbGl0dGxlIGJp
dCBkaWZmZXJlbnQ6Cj4gKiBJZiBJIHRlc3Qgb3BlbmluZyBpdCB3aXRoIHRlc3RwbWQsIEkgc2Vl
IG5vIGNoYW5nZSBiZXR3ZWVuIHZlcnNpb25zCj4gKiBJZiBJIGZvcndhcmQgcGFja2V0cyBiZXR3
ZWVuIHR3byB2aG9zdC1uZXQgaW50ZXJmYWNlcyBpbiB0aGUgZ3Vlc3QKPiB1c2luZyBhIGxpbnV4
IGJyaWRnZSBpbiB0aGUgaG9zdDoKPiAgICAtIG5ldHBlcmYgVURQX1NUUkVBTSBzaG93cyBhIHBl
cmZvcm1hbmNlIGluY3JlYXNlIG9mIDEuOCwgYWxtb3N0Cj4gZG91YmxpbmcgcGVyZm9ybWFuY2Uu
IFRoaXMgZ2V0cyBsb3dlciBhcyBmcmFtZSBzaXplIGluY3JlYXNlLgo+ICAgIC0gcmVzdHMgb2Yg
dGhlIHRlc3QgZ29lcyBub3RpY2VhYmx5IHdvcnNlOiBVRFBfUlIgZ29lcyBmcm9tIH42MzQ3Cj4g
dHJhbnNhY3Rpb25zL3NlYyB0byA1ODMwCj4gICAgLSBUQ1BfU1RSRUFNIGdvZXMgZnJvbSB+MTAu
NyBnYnBzIHRvIH43R2JwcwoKCldoaWNoIGRpcmVjdGlvbiBkaWQgeW91IG1lYW4gaGVyZT8gR3Vl
c3QgVFggb3IgUlg/CgoKPiAgICAtIFRDUF9SUiBmcm9tIDYyMjMuNjQgdHJhbnNhY3Rpb25zL3Nl
YyB0byA1NzM5LjQ0CgoKUGVyZiBkaWZmIG1pZ2h0IGhlbHAuIEkgdGhpbmsgd2UgY2FuIHN0YXJ0
IGZyb20gdGhlIFJSIHJlc3VsdCB3aGljaCAKc2hvdWxkIGJlIGVhc2llci4gTWF5YmUgeW91IGNh
biB0ZXN0IGl0IGZvciBlYWNoIHBhdGNoIHRoZW4geW91IG1heSBzZWUgCndoaWNoIHBhdGNoIGlz
IHRoZSBzb3VyY2Ugb2YgdGhlIHJlZ3Jlc3Npb24uCgpUaGFua3MKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
