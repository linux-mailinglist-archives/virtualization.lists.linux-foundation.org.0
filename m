Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E1919F7A4
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 16:09:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 357048850C;
	Mon,  6 Apr 2020 14:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4GyAOruJvf6Q; Mon,  6 Apr 2020 14:09:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8DD4988515;
	Mon,  6 Apr 2020 14:09:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71D7CC1AE2;
	Mon,  6 Apr 2020 14:09:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2031C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 14:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DBD1588512
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 14:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ATEdGm2yESHs
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 14:09:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0D61B8850C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 14:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586182188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wl9a4vsMx6popLEQnps/1oTIMHKzOVah2HdwSj1HK4k=;
 b=afxC2Gic7GtVXZBL3NAff0RwQPckNgXgqUaKS0A4iZMU+b3+2+xvKFwoysBmGrMu8i+eJY
 ifJsf9ckAEi++K0QonhxNyjCp4J90U/V6igDEbpuA8Xx/aoz56dLF1YdsEC7FqboJNGlJh
 BKSyu4nL8NbD9MIWrJNzDCs+tOTxlLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-20pdoNKkNzyFdMakHIAuLg-1; Mon, 06 Apr 2020 10:09:35 -0400
X-MC-Unique: 20pdoNKkNzyFdMakHIAuLg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DE5313F6;
 Mon,  6 Apr 2020 14:09:34 +0000 (UTC)
Received: from [10.72.12.191] (ovpn-12-191.pek2.redhat.com [10.72.12.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 115529D352;
 Mon,  6 Apr 2020 14:09:28 +0000 (UTC)
Subject: Re: [PATCH] vhost: force spec specified alignment on types
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200406124931.120768-1-mst@redhat.com>
 <045c84ed-151e-a850-9c72-5079bd2775e6@redhat.com>
 <20200406095424-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d171447e-eabc-60ab-6de7-41ac9b82d7d1@redhat.com>
Date: Mon, 6 Apr 2020 22:09:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200406095424-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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

Ck9uIDIwMjAvNC82IOS4i+WNiDk6NTUsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBN
b24sIEFwciAwNiwgMjAyMCBhdCAwOTozNDowMFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDIwLzQvNiDkuIvljYg4OjUwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiBU
aGUgcmluZyBlbGVtZW50IGFkZHJlc3NlcyBhcmUgcGFzc2VkIGJldHdlZW4gY29tcG9uZW50cyB3
aXRoIGRpZmZlcmVudAo+Pj4gYWxpZ25tZW50cyBhc3N1bXB0aW9ucy4gVGh1cywgaWYgZ3Vlc3Qv
dXNlcnNwYWNlIHNlbGVjdHMgYSBwb2ludGVyIGFuZAo+Pj4gaG9zdCB0aGVuIGdldHMgYW5kIGRl
cmVmZXJlbmNlcyBpdCwgd2UgbWlnaHQgbmVlZCB0byBkZWNyZWFzZSB0aGUKPj4+IGNvbXBpbGVy
LXNlbGVjdGVkIGFsaWdubWVudCB0byBwcmV2ZW50IGNvbXBpbGVyIG9uIHRoZSBob3N0IGZyb20K
Pj4+IGFzc3VtaW5nIHBvaW50ZXIgaXMgYWxpZ25lZC4KPj4+Cj4+PiBUaGlzIGFjdHVhbGx5IHRy
aWdnZXJzIG9uIEFSTSB3aXRoIC1tYWJpPWFwY3MtZ251IC0gd2hpY2ggaXMgYQo+Pj4gZGVwcmVj
YXRlZCBjb25maWd1cmF0aW9uLCBidXQgaXQgc2VlbXMgc2FmZXIgdG8gaGFuZGxlIHRoaXMKPj4+
IGdlbmVyYWxseS4KPj4+Cj4+PiBJIHZlcmlmaWVkIHRoYXQgdGhlIHByb2R1Y2VkIGJpbmFyeSBp
cyBleGFjdGx5IGlkZW50aWNhbCBvbiB4ODYuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFl
bCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KPj4+IC0tLQo+Pj4KPj4+IFRoaXMgaXMgbXkg
cHJlZmVycmVkIHdheSB0byBoYW5kbGUgdGhlIEFSTSBpbmNvbXBhdGliaWxpdHkgaXNzdWVzCj4+
PiAoaW4gcHJlZmVyZW5jZSB0byBrY29uZmlnIGhhY2tzKS4KPj4+IEkgd2lsbCBwdXNoIHRoaXMg
aW50byBuZXh0IG5vdy4KPj4+IENvbW1lbnRzPwo+Pgo+PiBJJ20gbm90IHN1cmUgaWYgaXQncyB0
b28gbGF0ZSB0byBmaXguIEl0IHdvdWxkIHN0aWxsIGJlIHN0aWxsIHByb2JsZW1hdGljCj4+IGZv
ciB0aGUgdXNlcnNwYWNlIHRoYXQgaXMgdXNpbmcgb2xkIHVhcGkgaGVhZGVycz8KPj4KPj4gVGhh
bmtzCj4gSXQncyBub3QgYSBwcm9ibGVtIGluIHVzZXJzcGFjZS4gVGhlIHByb2JsZW0gaXMgd2hl
bgo+IHVzZXJzcGFjZS9ndWVzdCB1c2VzIDIgYnl0ZSBhbGlnbm1lbnQgYW5kIHBhc3NlcyBpdCB0
byBrZXJuZWwKPiBhc3N1bWluZyA4IGJ5dGUgYWxpZ25tZW50LiBUaGUgZml4IGlzIGZvciBob3N0
IG5vdCB0bwo+IG1ha2UgdGhlc2UgYXNzdW1wdGlvbnMuCgoKWWVzLCBidXQgSSBtZWFudCB3aGVu
IHVzZXJzcGFjZSBpcyBjb21wbGllZCB3aXRoIGFwY3MtZ251LCB0aGVuIGl0IHN0aWxsIAphc3N1
bWVzIDggYnl0ZSBhbGlnbm1lbnQ/CgpUaGFua3MKCgo+Cj4+PiAgICBkcml2ZXJzL3Zob3N0L3Zo
b3N0LmggICAgICAgICAgICB8ICA2ICsrLS0tCj4+PiAgICBpbmNsdWRlL3VhcGkvbGludXgvdmly
dGlvX3JpbmcuaCB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4+PiAgICAy
IGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+Pj4KPj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmggYi9kcml2ZXJzL3Zob3N0L3Zob3N0
LmgKPj4+IGluZGV4IGNjODI5MTgxNThkMi4uYTY3YmRhOTc5MmVjIDEwMDY0NAo+Pj4gLS0tIGEv
ZHJpdmVycy92aG9zdC92aG9zdC5oCj4+PiArKysgYi9kcml2ZXJzL3Zob3N0L3Zob3N0LmgKPj4+
IEBAIC03NCw5ICs3NCw5IEBAIHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgewo+Pj4gICAgCS8qIFRo
ZSBhY3R1YWwgcmluZyBvZiBidWZmZXJzLiAqLwo+Pj4gICAgCXN0cnVjdCBtdXRleCBtdXRleDsK
Pj4+ICAgIAl1bnNpZ25lZCBpbnQgbnVtOwo+Pj4gLQlzdHJ1Y3QgdnJpbmdfZGVzYyBfX3VzZXIg
KmRlc2M7Cj4+PiAtCXN0cnVjdCB2cmluZ19hdmFpbCBfX3VzZXIgKmF2YWlsOwo+Pj4gLQlzdHJ1
Y3QgdnJpbmdfdXNlZCBfX3VzZXIgKnVzZWQ7Cj4+PiArCXZyaW5nX2Rlc2NfdCBfX3VzZXIgKmRl
c2M7Cj4+PiArCXZyaW5nX2F2YWlsX3QgX191c2VyICphdmFpbDsKPj4+ICsJdnJpbmdfdXNlZF90
IF9fdXNlciAqdXNlZDsKPj4+ICAgIAljb25zdCBzdHJ1Y3Qgdmhvc3RfaW90bGJfbWFwICptZXRh
X2lvdGxiW1ZIT1NUX05VTV9BRERSU107Cj4+PiAgICAJc3RydWN0IHZob3N0X2Rlc2MgKmRlc2Nz
Owo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC92aXJ0aW9fcmluZy5oIGIvaW5j
bHVkZS91YXBpL2xpbnV4L3ZpcnRpb19yaW5nLmgKPj4+IGluZGV4IDU1OWY0MmU3MzMxNS4uY2Q2
ZTBiMmVhZjJmIDEwMDY0NAo+Pj4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZpcnRpb19yaW5n
LmgKPj4+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92aXJ0aW9fcmluZy5oCj4+PiBAQCAtMTE4
LDE2ICsxMTgsNiBAQCBzdHJ1Y3QgdnJpbmdfdXNlZCB7Cj4+PiAgICAJc3RydWN0IHZyaW5nX3Vz
ZWRfZWxlbSByaW5nW107Cj4+PiAgICB9Owo+Pj4gLXN0cnVjdCB2cmluZyB7Cj4+PiAtCXVuc2ln
bmVkIGludCBudW07Cj4+PiAtCj4+PiAtCXN0cnVjdCB2cmluZ19kZXNjICpkZXNjOwo+Pj4gLQo+
Pj4gLQlzdHJ1Y3QgdnJpbmdfYXZhaWwgKmF2YWlsOwo+Pj4gLQo+Pj4gLQlzdHJ1Y3QgdnJpbmdf
dXNlZCAqdXNlZDsKPj4+IC19Owo+Pj4gLQo+Pj4gICAgLyogQWxpZ25tZW50IHJlcXVpcmVtZW50
cyBmb3IgdnJpbmcgZWxlbWVudHMuCj4+PiAgICAgKiBXaGVuIHVzaW5nIHByZS12aXJ0aW8gMS4w
IGxheW91dCwgdGhlc2UgZmFsbCBvdXQgbmF0dXJhbGx5Lgo+Pj4gICAgICovCj4+PiBAQCAtMTY0
LDYgKzE1NCwzNyBAQCBzdHJ1Y3QgdnJpbmcgewo+Pj4gICAgI2RlZmluZSB2cmluZ191c2VkX2V2
ZW50KHZyKSAoKHZyKS0+YXZhaWwtPnJpbmdbKHZyKS0+bnVtXSkKPj4+ICAgICNkZWZpbmUgdnJp
bmdfYXZhaWxfZXZlbnQodnIpICgqKF9fdmlydGlvMTYgKikmKHZyKS0+dXNlZC0+cmluZ1sodnIp
LT5udW1dKQo+Pj4gKy8qCj4+PiArICogVGhlIHJpbmcgZWxlbWVudCBhZGRyZXNzZXMgYXJlIHBh
c3NlZCBiZXR3ZWVuIGNvbXBvbmVudHMgd2l0aCBkaWZmZXJlbnQKPj4+ICsgKiBhbGlnbm1lbnRz
IGFzc3VtcHRpb25zLiBUaHVzLCB3ZSBtaWdodCBuZWVkIHRvIGRlY3JlYXNlIHRoZSBjb21waWxl
ci1zZWxlY3RlZAo+Pj4gKyAqIGFsaWdubWVudCwgYW5kIHNvIG11c3QgdXNlIGEgdHlwZWRlZiB0
byBtYWtlIHN1cmUgdGhlIF9fYWxpZ25lZCBhdHRyaWJ1dGUKPj4+ICsgKiBhY3R1YWxseSB0YWtl
cyBob2xkOgo+Pj4gKyAqCj4+PiArICogaHR0cHM6Ly9nY2MuZ251Lm9yZy9vbmxpbmVkb2NzLy9n
Y2MvQ29tbW9uLVR5cGUtQXR0cmlidXRlcy5odG1sI0NvbW1vbi1UeXBlLUF0dHJpYnV0ZXMKPj4+
ICsgKgo+Pj4gKyAqIFdoZW4gdXNlZCBvbiBhIHN0cnVjdCwgb3Igc3RydWN0IG1lbWJlciwgdGhl
IGFsaWduZWQgYXR0cmlidXRlIGNhbiBvbmx5Cj4+PiArICogaW5jcmVhc2UgdGhlIGFsaWdubWVu
dDsgaW4gb3JkZXIgdG8gZGVjcmVhc2UgaXQsIHRoZSBwYWNrZWQgYXR0cmlidXRlIG11c3QKPj4+
ICsgKiBiZSBzcGVjaWZpZWQgYXMgd2VsbC4gV2hlbiB1c2VkIGFzIHBhcnQgb2YgYSB0eXBlZGVm
LCB0aGUgYWxpZ25lZCBhdHRyaWJ1dGUKPj4+ICsgKiBjYW4gYm90aCBpbmNyZWFzZSBhbmQgZGVj
cmVhc2UgYWxpZ25tZW50LCBhbmQgc3BlY2lmeWluZyB0aGUgcGFja2VkCj4+PiArICogYXR0cmli
dXRlIGdlbmVyYXRlcyBhIHdhcm5pbmcuCj4+PiArICovCj4+PiArdHlwZWRlZiBzdHJ1Y3QgdnJp
bmdfZGVzYyBfX2F0dHJpYnV0ZV9fKChhbGlnbmVkKFZSSU5HX0RFU0NfQUxJR05fU0laRSkpKQo+
Pj4gKwl2cmluZ19kZXNjX3Q7Cj4+PiArdHlwZWRlZiBzdHJ1Y3QgdnJpbmdfYXZhaWwgX19hdHRy
aWJ1dGVfXygoYWxpZ25lZChWUklOR19BVkFJTF9BTElHTl9TSVpFKSkpCj4+PiArCXZyaW5nX2F2
YWlsX3Q7Cj4+PiArdHlwZWRlZiBzdHJ1Y3QgdnJpbmdfdXNlZCBfX2F0dHJpYnV0ZV9fKChhbGln
bmVkKFZSSU5HX1VTRURfQUxJR05fU0laRSkpKQo+Pj4gKwl2cmluZ191c2VkX3Q7Cj4+PiArCj4+
PiArc3RydWN0IHZyaW5nIHsKPj4+ICsJdW5zaWduZWQgaW50IG51bTsKPj4+ICsKPj4+ICsJdnJp
bmdfZGVzY190ICpkZXNjOwo+Pj4gKwo+Pj4gKwl2cmluZ19hdmFpbF90ICphdmFpbDsKPj4+ICsK
Pj4+ICsJdnJpbmdfdXNlZF90ICp1c2VkOwo+Pj4gK307Cj4+PiArCj4+PiAgICBzdGF0aWMgaW5s
aW5lIHZvaWQgdnJpbmdfaW5pdChzdHJ1Y3QgdnJpbmcgKnZyLCB1bnNpZ25lZCBpbnQgbnVtLCB2
b2lkICpwLAo+Pj4gICAgCQkJICAgICAgdW5zaWduZWQgbG9uZyBhbGlnbikKPj4+ICAgIHsKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
