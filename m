Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2950E1EF00E
	for <lists.virtualization@lfdr.de>; Fri,  5 Jun 2020 05:40:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7C70987745;
	Fri,  5 Jun 2020 03:40:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9cm4JU8n42rH; Fri,  5 Jun 2020 03:40:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CA77187749;
	Fri,  5 Jun 2020 03:40:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3EC7C016E;
	Fri,  5 Jun 2020 03:40:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7693C016E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 03:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CC79285D4C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 03:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9MvhodypKiQL
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 03:40:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B012785D3D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 03:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591328428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+XRm7Fs7zNlH2EKv4SYh8NMSzGAObCRW7/zCrf8kTM=;
 b=BCjq1z7jSjMubIuP8OVFJiZydGUG/4SxUCo8lT48BGPP9UXgE6UEDNslnKbg0ILuHdf9Lw
 X0jTo+CnXcpUGXBUu3mrzCK7OasCSqtX06uRs+/zjZX2FeF5FiMr0Z992QPSehtLBP29qi
 rMwEOQn5hrZbg22ua5LZ6CXZp7kHw88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-WjnfLQgyPAadytx9KbfT2Q-1; Thu, 04 Jun 2020 23:40:24 -0400
X-MC-Unique: WjnfLQgyPAadytx9KbfT2Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD756100960F;
 Fri,  5 Jun 2020 03:40:23 +0000 (UTC)
Received: from [10.72.12.233] (ovpn-12-233.pek2.redhat.com [10.72.12.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3AE45C290;
 Fri,  5 Jun 2020 03:40:18 +0000 (UTC)
Subject: Re: [PATCH RFC 03/13] vhost: batching fetches
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200602130543.578420-1-mst@redhat.com>
 <20200602130543.578420-4-mst@redhat.com>
 <3323daa2-19ed-02de-0ff7-ab150f949fff@redhat.com>
 <20200604045830-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6c2e6cc7-27c5-445b-f252-0356ff8a83f3@redhat.com>
Date: Fri, 5 Jun 2020 11:40:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200604045830-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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

Ck9uIDIwMjAvNi80IOS4i+WNiDQ6NTksIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBX
ZWQsIEp1biAwMywgMjAyMCBhdCAwMzoyNzozOVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDIwLzYvMiDkuIvljYg5OjA2LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiBX
aXRoIHRoaXMgcGF0Y2ggYXBwbGllZCwgbmV3IGFuZCBvbGQgY29kZSBwZXJmb3JtIGlkZW50aWNh
bGx5Lgo+Pj4KPj4+IExvdHMgb2YgZXh0cmEgb3B0aW1pemF0aW9ucyBhcmUgbm93IHBvc3NpYmxl
LCBlLmcuCj4+PiB3ZSBjYW4gZmV0Y2ggbXVsdGlwbGUgaGVhZHMgd2l0aCBjb3B5X2Zyb20vdG9f
dXNlciBub3cuCj4+PiBXZSBjYW4gZ2V0IHJpZCBvZiBtYWludGFpbmluZyB0aGUgbG9nIGFycmF5
LiAgRXRjIGV0Yy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW48bXN0
QHJlZGhhdC5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBFdWdlbmlvIFDDqXJlejxlcGVyZXptYUBy
ZWRoYXQuY29tPgo+Pj4gTGluazpodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjAwNDAxMTgz
MTE4LjgzMzQtNC1lcGVyZXptYUByZWRoYXQuY29tCj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVs
IFMuIFRzaXJraW48bXN0QHJlZGhhdC5jb20+Cj4+PiAtLS0KPj4+ICAgIGRyaXZlcnMvdmhvc3Qv
dGVzdC5jICB8ICAyICstCj4+PiAgICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCA0NyArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4+PiAgICBkcml2ZXJzL3Zob3N0
L3Zob3N0LmggfCAgNSArKysrLQo+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3Rl
c3QuYyBiL2RyaXZlcnMvdmhvc3QvdGVzdC5jCj4+PiBpbmRleCA5YTNhMDkwMDVlMDMuLjAyODA2
ZDZmODRlZiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvdmhvc3QvdGVzdC5jCj4+PiArKysgYi9k
cml2ZXJzL3Zob3N0L3Rlc3QuYwo+Pj4gQEAgLTExOSw3ICsxMTksNyBAQCBzdGF0aWMgaW50IHZo
b3N0X3Rlc3Rfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZikKPj4+ICAg
IAlkZXYgPSAmbi0+ZGV2Owo+Pj4gICAgCXZxc1tWSE9TVF9URVNUX1ZRXSA9ICZuLT52cXNbVkhP
U1RfVEVTVF9WUV07Cj4+PiAgICAJbi0+dnFzW1ZIT1NUX1RFU1RfVlFdLmhhbmRsZV9raWNrID0g
aGFuZGxlX3ZxX2tpY2s7Cj4+PiAtCXZob3N0X2Rldl9pbml0KGRldiwgdnFzLCBWSE9TVF9URVNU
X1ZRX01BWCwgVUlPX01BWElPViwKPj4+ICsJdmhvc3RfZGV2X2luaXQoZGV2LCB2cXMsIFZIT1NU
X1RFU1RfVlFfTUFYLCBVSU9fTUFYSU9WICsgNjQsCj4+PiAgICAJCSAgICAgICBWSE9TVF9URVNU
X1BLVF9XRUlHSFQsIFZIT1NUX1RFU1RfV0VJR0hULCBOVUxMKTsKPj4+ICAgIAlmLT5wcml2YXRl
X2RhdGEgPSBuOwo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYyBiL2RyaXZl
cnMvdmhvc3Qvdmhvc3QuYwo+Pj4gaW5kZXggOGY5YTA3MjgyNjI1Li5hY2EyYTViMGQwNzggMTAw
NjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPj4+ICsrKyBiL2RyaXZlcnMvdmhv
c3Qvdmhvc3QuYwo+Pj4gQEAgLTI5OSw2ICsyOTksNyBAQCBzdGF0aWMgdm9pZCB2aG9zdF92cV9y
ZXNldChzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsCj4+PiAgICB7Cj4+PiAgICAJdnEtPm51bSA9IDE7
Cj4+PiAgICAJdnEtPm5kZXNjcyA9IDA7Cj4+PiArCXZxLT5maXJzdF9kZXNjID0gMDsKPj4+ICAg
IAl2cS0+ZGVzYyA9IE5VTEw7Cj4+PiAgICAJdnEtPmF2YWlsID0gTlVMTDsKPj4+ICAgIAl2cS0+
dXNlZCA9IE5VTEw7Cj4+PiBAQCAtMzY3LDYgKzM2OCwxMSBAQCBzdGF0aWMgaW50IHZob3N0X3dv
cmtlcih2b2lkICpkYXRhKQo+Pj4gICAgCXJldHVybiAwOwo+Pj4gICAgfQo+Pj4gK3N0YXRpYyBp
bnQgdmhvc3RfdnFfbnVtX2JhdGNoX2Rlc2NzKHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxKQo+
Pj4gK3sKPj4+ICsJcmV0dXJuIHZxLT5tYXhfZGVzY3MgLSBVSU9fTUFYSU9WOwo+Pj4gK30KPj4g
MSBkZXNjcmlwdG9yIGRvZXMgbm90IG1lYW4gMSBpb3YsIGUuZyB1c2Vyc3BhY2UgbWF5IHBhc3Mg
c2V2ZXJhbCAxIGJ5dGUKPj4gbGVuZ3RoIG1lbW9yeSByZWdpb25zIGZvciB1cyB0byB0cmFuc2xh
dGUuCj4+Cj4gWWVzIGJ1dCBJIGRvbid0IHNlZSB0aGUgcmVsZXZhbmNlLiBUaGlzIHRlbGxzIHVz
IGhvdyBtYW55IGRlc2NyaXB0b3JzIHRvCj4gYmF0Y2gsIG5vdCBob3cgbWFueSBJT1ZzLgoKClll
cywgYnV0IHF1ZXN0aW9ucyBhcmU6CgotIHRoaXMgaW50cm9kdWNlIGFub3RoZXIgb2JzdGFjbGUg
dG8gc3VwcG9ydCBtb3JlIHRoYW4gMUsgcXVldWUgc2l6ZQotIGlmIHdlIHN1cHBvcnQgMUsgcXVl
dWUgc2l6ZSwgZG9lcyBpdCBtZWFuIHdlIG5lZWQgdG8gY2FjaGUgMUsgCmRlc2NyaXB0b3JzLCB3
aGljaCBzZWVtcyBhIGxhcmdlIHN0cmVzcyBvbiB0aGUgY2FjaGUKClRoYW5rcwoKCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
