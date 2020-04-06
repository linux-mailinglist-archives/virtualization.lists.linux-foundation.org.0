Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 508C819F809
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 16:34:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9DB16233B8;
	Mon,  6 Apr 2020 14:34:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rK+ujgcl9391; Mon,  6 Apr 2020 14:34:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C2B132324E;
	Mon,  6 Apr 2020 14:34:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7EA1C0177;
	Mon,  6 Apr 2020 14:34:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DADA1C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 14:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C4D24863E1
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 14:34:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oLl_BYysEQr9
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 14:34:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4876485EAC
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 14:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586183686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IJvEdYDLaOnX9xJG3HxXlME2+2zcIWCbfErT4uuM1A8=;
 b=D2cMUT1wDYfBd8c4l2NM3orVyHRoYcUi1ZAEJ1/W9ZsktBX2vTRfyw1KpjhH24MC3VdQ75
 vXayMrwCISJyPRsWwelb94j5g3L0TGzil7KotQWiOcelHGVZ74ckyQERCINqFshU0JbJj2
 5usW0j6YCx2XS36vIX0gWEE6sVPt54E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-1f3_cFXTOamhW4NW119LEw-1; Mon, 06 Apr 2020 10:34:45 -0400
X-MC-Unique: 1f3_cFXTOamhW4NW119LEw-1
Received: by mail-wr1-f69.google.com with SMTP id o10so592136wrj.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 07:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IJvEdYDLaOnX9xJG3HxXlME2+2zcIWCbfErT4uuM1A8=;
 b=e7q5CMzDDVkDVcMeBozXzHDWuhHaQ0ChWT3ioumk4f3Kk5Y2yVgUa4I673uJiHGR4n
 zw1gJkdnmGwW92Z97T3gzZ5JU3DJL8Uu9uymNmpR/Arey8a4QdAG4Ukc+1Jxc4+RNR3n
 3F27kVKLLFvT1UE8Liu6oJwjypkB1UgUGKnSqesAve4lZ2SrD+mQxxpZEqMVI5CXpUfY
 bHQBixGV/VXa7JJIdosOo+URPNG/ZwbbqovyNupK+Jh2a56L79NaFR//6blWGxeTsS5+
 3IF9bDXaa1lo+G6V/R/ye21nEexs4VqV3iY4ewgLkBBpfL1ssN8cz46oLPuFGuroT2Yo
 u3Bg==
X-Gm-Message-State: AGi0PuaZFEyqCFh5Sqmsx3wwfoevD5Qcv/yOv4bsAIl5UULyJ1Zj8bLe
 /FUDazer+PrpEIY8Lq2Ea0kpDcJenZYW6RNcSmXPrEA0/WPjYCAZDKHHJkUDkHSPjcCrlviuB3u
 uuN2lZwXjQsKoxMJbsJjLMbHvM/l2H8h6Mx/7lsBd1g==
X-Received: by 2002:a5d:468b:: with SMTP id u11mr10561959wrq.89.1586183683844; 
 Mon, 06 Apr 2020 07:34:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypKVC46xSuUV+b+SZgNesYPGvUEvVa9w1c6TmOn2m1iOj0U4q5Cbs3Io5eAGagoYg5SQI3CbzQ==
X-Received: by 2002:a5d:468b:: with SMTP id u11mr10561937wrq.89.1586183683607; 
 Mon, 06 Apr 2020 07:34:43 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id o13sm4347586wrm.74.2020.04.06.07.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 07:34:43 -0700 (PDT)
Date: Mon, 6 Apr 2020 10:34:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: force spec specified alignment on types
Message-ID: <20200406102531-mutt-send-email-mst@kernel.org>
References: <20200406124931.120768-1-mst@redhat.com>
 <045c84ed-151e-a850-9c72-5079bd2775e6@redhat.com>
 <20200406095424-mutt-send-email-mst@kernel.org>
 <d171447e-eabc-60ab-6de7-41ac9b82d7d1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d171447e-eabc-60ab-6de7-41ac9b82d7d1@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gTW9uLCBBcHIgMDYsIDIwMjAgYXQgMTA6MDk6MjdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzQvNiDkuIvljYg5OjU1LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBPbiBNb24sIEFwciAwNiwgMjAyMCBhdCAwOTozNDowMFBNICswODAwLCBKYXNvbiBXYW5n
IHdyb3RlOgo+ID4gPiBPbiAyMDIwLzQvNiDkuIvljYg4OjUwLCBNaWNoYWVsIFMuIFRzaXJraW4g
d3JvdGU6Cj4gPiA+ID4gVGhlIHJpbmcgZWxlbWVudCBhZGRyZXNzZXMgYXJlIHBhc3NlZCBiZXR3
ZWVuIGNvbXBvbmVudHMgd2l0aCBkaWZmZXJlbnQKPiA+ID4gPiBhbGlnbm1lbnRzIGFzc3VtcHRp
b25zLiBUaHVzLCBpZiBndWVzdC91c2Vyc3BhY2Ugc2VsZWN0cyBhIHBvaW50ZXIgYW5kCj4gPiA+
ID4gaG9zdCB0aGVuIGdldHMgYW5kIGRlcmVmZXJlbmNlcyBpdCwgd2UgbWlnaHQgbmVlZCB0byBk
ZWNyZWFzZSB0aGUKPiA+ID4gPiBjb21waWxlci1zZWxlY3RlZCBhbGlnbm1lbnQgdG8gcHJldmVu
dCBjb21waWxlciBvbiB0aGUgaG9zdCBmcm9tCj4gPiA+ID4gYXNzdW1pbmcgcG9pbnRlciBpcyBh
bGlnbmVkLgo+ID4gPiA+IAo+ID4gPiA+IFRoaXMgYWN0dWFsbHkgdHJpZ2dlcnMgb24gQVJNIHdp
dGggLW1hYmk9YXBjcy1nbnUgLSB3aGljaCBpcyBhCj4gPiA+ID4gZGVwcmVjYXRlZCBjb25maWd1
cmF0aW9uLCBidXQgaXQgc2VlbXMgc2FmZXIgdG8gaGFuZGxlIHRoaXMKPiA+ID4gPiBnZW5lcmFs
bHkuCj4gPiA+ID4gCj4gPiA+ID4gSSB2ZXJpZmllZCB0aGF0IHRoZSBwcm9kdWNlZCBiaW5hcnkg
aXMgZXhhY3RseSBpZGVudGljYWwgb24geDg2Lgo+ID4gPiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+
ID4gCj4gPiA+ID4gVGhpcyBpcyBteSBwcmVmZXJyZWQgd2F5IHRvIGhhbmRsZSB0aGUgQVJNIGlu
Y29tcGF0aWJpbGl0eSBpc3N1ZXMKPiA+ID4gPiAoaW4gcHJlZmVyZW5jZSB0byBrY29uZmlnIGhh
Y2tzKS4KPiA+ID4gPiBJIHdpbGwgcHVzaCB0aGlzIGludG8gbmV4dCBub3cuCj4gPiA+ID4gQ29t
bWVudHM/Cj4gPiA+IAo+ID4gPiBJJ20gbm90IHN1cmUgaWYgaXQncyB0b28gbGF0ZSB0byBmaXgu
IEl0IHdvdWxkIHN0aWxsIGJlIHN0aWxsIHByb2JsZW1hdGljCj4gPiA+IGZvciB0aGUgdXNlcnNw
YWNlIHRoYXQgaXMgdXNpbmcgb2xkIHVhcGkgaGVhZGVycz8KPiA+ID4gCj4gPiA+IFRoYW5rcwo+
ID4gSXQncyBub3QgYSBwcm9ibGVtIGluIHVzZXJzcGFjZS4gVGhlIHByb2JsZW0gaXMgd2hlbgo+
ID4gdXNlcnNwYWNlL2d1ZXN0IHVzZXMgMiBieXRlIGFsaWdubWVudCBhbmQgcGFzc2VzIGl0IHRv
IGtlcm5lbAo+ID4gYXNzdW1pbmcgOCBieXRlIGFsaWdubWVudC4gVGhlIGZpeCBpcyBmb3IgaG9z
dCBub3QgdG8KPiA+IG1ha2UgdGhlc2UgYXNzdW1wdGlvbnMuCj4gCj4gCj4gWWVzLCBidXQgSSBt
ZWFudCB3aGVuIHVzZXJzcGFjZSBpcyBjb21wbGllZCB3aXRoIGFwY3MtZ251LCB0aGVuIGl0IHN0
aWxsCj4gYXNzdW1lcyA4IGJ5dGUgYWxpZ25tZW50Pwo+IAo+IFRoYW5rcwoKClRoYXQncyBub3Qg
YSBwcm9ibGVtIHNpbmNlIHdpdGggdmhvc3QgdXNlcnNwYWNlIGlzIGRvaW5nIHRoZSBhbGxvY2F0
aW9uLgpTbyBpdCBjYW4gaW5jcmVhc2UgYWxpZ25tZW50IHdpdGggbm8gYmFkIGVmZmVjdC4KCkkg
YWdyZWUgaXQncyBwcm9iYWJseSBzYWZlc3Qgbm90IHRvIHRvdWNoIHN0cnVjdCB2cmluZyBhdCBh
bGwgdGhvdWdoLgoKCj4gCj4gPiAKPiA+ID4gPiAgICBkcml2ZXJzL3Zob3N0L3Zob3N0LmggICAg
ICAgICAgICB8ICA2ICsrLS0tCj4gPiA+ID4gICAgaW5jbHVkZS91YXBpL2xpbnV4L3ZpcnRpb19y
aW5nLmggfCA0MSArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ID4gPiA+ICAgIDIg
ZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4gPiA+ID4g
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuaCBiL2RyaXZlcnMvdmhv
c3Qvdmhvc3QuaAo+ID4gPiA+IGluZGV4IGNjODI5MTgxNThkMi4uYTY3YmRhOTc5MmVjIDEwMDY0
NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuaAo+ID4gPiA+ICsrKyBiL2RyaXZl
cnMvdmhvc3Qvdmhvc3QuaAo+ID4gPiA+IEBAIC03NCw5ICs3NCw5IEBAIHN0cnVjdCB2aG9zdF92
aXJ0cXVldWUgewo+ID4gPiA+ICAgIAkvKiBUaGUgYWN0dWFsIHJpbmcgb2YgYnVmZmVycy4gKi8K
PiA+ID4gPiAgICAJc3RydWN0IG11dGV4IG11dGV4Owo+ID4gPiA+ICAgIAl1bnNpZ25lZCBpbnQg
bnVtOwo+ID4gPiA+IC0Jc3RydWN0IHZyaW5nX2Rlc2MgX191c2VyICpkZXNjOwo+ID4gPiA+IC0J
c3RydWN0IHZyaW5nX2F2YWlsIF9fdXNlciAqYXZhaWw7Cj4gPiA+ID4gLQlzdHJ1Y3QgdnJpbmdf
dXNlZCBfX3VzZXIgKnVzZWQ7Cj4gPiA+ID4gKwl2cmluZ19kZXNjX3QgX191c2VyICpkZXNjOwo+
ID4gPiA+ICsJdnJpbmdfYXZhaWxfdCBfX3VzZXIgKmF2YWlsOwo+ID4gPiA+ICsJdnJpbmdfdXNl
ZF90IF9fdXNlciAqdXNlZDsKPiA+ID4gPiAgICAJY29uc3Qgc3RydWN0IHZob3N0X2lvdGxiX21h
cCAqbWV0YV9pb3RsYltWSE9TVF9OVU1fQUREUlNdOwo+ID4gPiA+ICAgIAlzdHJ1Y3Qgdmhvc3Rf
ZGVzYyAqZGVzY3M7Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC92aXJ0
aW9fcmluZy5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L3ZpcnRpb19yaW5nLmgKPiA+ID4gPiBpbmRl
eCA1NTlmNDJlNzMzMTUuLmNkNmUwYjJlYWYyZiAxMDA2NDQKPiA+ID4gPiAtLS0gYS9pbmNsdWRl
L3VhcGkvbGludXgvdmlydGlvX3JpbmcuaAo+ID4gPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51
eC92aXJ0aW9fcmluZy5oCj4gPiA+ID4gQEAgLTExOCwxNiArMTE4LDYgQEAgc3RydWN0IHZyaW5n
X3VzZWQgewo+ID4gPiA+ICAgIAlzdHJ1Y3QgdnJpbmdfdXNlZF9lbGVtIHJpbmdbXTsKPiA+ID4g
PiAgICB9Owo+ID4gPiA+IC1zdHJ1Y3QgdnJpbmcgewo+ID4gPiA+IC0JdW5zaWduZWQgaW50IG51
bTsKPiA+ID4gPiAtCj4gPiA+ID4gLQlzdHJ1Y3QgdnJpbmdfZGVzYyAqZGVzYzsKPiA+ID4gPiAt
Cj4gPiA+ID4gLQlzdHJ1Y3QgdnJpbmdfYXZhaWwgKmF2YWlsOwo+ID4gPiA+IC0KPiA+ID4gPiAt
CXN0cnVjdCB2cmluZ191c2VkICp1c2VkOwo+ID4gPiA+IC19Owo+ID4gPiA+IC0KPiA+ID4gPiAg
ICAvKiBBbGlnbm1lbnQgcmVxdWlyZW1lbnRzIGZvciB2cmluZyBlbGVtZW50cy4KPiA+ID4gPiAg
ICAgKiBXaGVuIHVzaW5nIHByZS12aXJ0aW8gMS4wIGxheW91dCwgdGhlc2UgZmFsbCBvdXQgbmF0
dXJhbGx5Lgo+ID4gPiA+ICAgICAqLwo+ID4gPiA+IEBAIC0xNjQsNiArMTU0LDM3IEBAIHN0cnVj
dCB2cmluZyB7Cj4gPiA+ID4gICAgI2RlZmluZSB2cmluZ191c2VkX2V2ZW50KHZyKSAoKHZyKS0+
YXZhaWwtPnJpbmdbKHZyKS0+bnVtXSkKPiA+ID4gPiAgICAjZGVmaW5lIHZyaW5nX2F2YWlsX2V2
ZW50KHZyKSAoKihfX3ZpcnRpbzE2ICopJih2ciktPnVzZWQtPnJpbmdbKHZyKS0+bnVtXSkKPiA+
ID4gPiArLyoKPiA+ID4gPiArICogVGhlIHJpbmcgZWxlbWVudCBhZGRyZXNzZXMgYXJlIHBhc3Nl
ZCBiZXR3ZWVuIGNvbXBvbmVudHMgd2l0aCBkaWZmZXJlbnQKPiA+ID4gPiArICogYWxpZ25tZW50
cyBhc3N1bXB0aW9ucy4gVGh1cywgd2UgbWlnaHQgbmVlZCB0byBkZWNyZWFzZSB0aGUgY29tcGls
ZXItc2VsZWN0ZWQKPiA+ID4gPiArICogYWxpZ25tZW50LCBhbmQgc28gbXVzdCB1c2UgYSB0eXBl
ZGVmIHRvIG1ha2Ugc3VyZSB0aGUgX19hbGlnbmVkIGF0dHJpYnV0ZQo+ID4gPiA+ICsgKiBhY3R1
YWxseSB0YWtlcyBob2xkOgo+ID4gPiA+ICsgKgo+ID4gPiA+ICsgKiBodHRwczovL2djYy5nbnUu
b3JnL29ubGluZWRvY3MvL2djYy9Db21tb24tVHlwZS1BdHRyaWJ1dGVzLmh0bWwjQ29tbW9uLVR5
cGUtQXR0cmlidXRlcwo+ID4gPiA+ICsgKgo+ID4gPiA+ICsgKiBXaGVuIHVzZWQgb24gYSBzdHJ1
Y3QsIG9yIHN0cnVjdCBtZW1iZXIsIHRoZSBhbGlnbmVkIGF0dHJpYnV0ZSBjYW4gb25seQo+ID4g
PiA+ICsgKiBpbmNyZWFzZSB0aGUgYWxpZ25tZW50OyBpbiBvcmRlciB0byBkZWNyZWFzZSBpdCwg
dGhlIHBhY2tlZCBhdHRyaWJ1dGUgbXVzdAo+ID4gPiA+ICsgKiBiZSBzcGVjaWZpZWQgYXMgd2Vs
bC4gV2hlbiB1c2VkIGFzIHBhcnQgb2YgYSB0eXBlZGVmLCB0aGUgYWxpZ25lZCBhdHRyaWJ1dGUK
PiA+ID4gPiArICogY2FuIGJvdGggaW5jcmVhc2UgYW5kIGRlY3JlYXNlIGFsaWdubWVudCwgYW5k
IHNwZWNpZnlpbmcgdGhlIHBhY2tlZAo+ID4gPiA+ICsgKiBhdHRyaWJ1dGUgZ2VuZXJhdGVzIGEg
d2FybmluZy4KPiA+ID4gPiArICovCj4gPiA+ID4gK3R5cGVkZWYgc3RydWN0IHZyaW5nX2Rlc2Mg
X19hdHRyaWJ1dGVfXygoYWxpZ25lZChWUklOR19ERVNDX0FMSUdOX1NJWkUpKSkKPiA+ID4gPiAr
CXZyaW5nX2Rlc2NfdDsKPiA+ID4gPiArdHlwZWRlZiBzdHJ1Y3QgdnJpbmdfYXZhaWwgX19hdHRy
aWJ1dGVfXygoYWxpZ25lZChWUklOR19BVkFJTF9BTElHTl9TSVpFKSkpCj4gPiA+ID4gKwl2cmlu
Z19hdmFpbF90Owo+ID4gPiA+ICt0eXBlZGVmIHN0cnVjdCB2cmluZ191c2VkIF9fYXR0cmlidXRl
X18oKGFsaWduZWQoVlJJTkdfVVNFRF9BTElHTl9TSVpFKSkpCj4gPiA+ID4gKwl2cmluZ191c2Vk
X3Q7Cj4gPiA+ID4gKwo+ID4gPiA+ICtzdHJ1Y3QgdnJpbmcgewo+ID4gPiA+ICsJdW5zaWduZWQg
aW50IG51bTsKPiA+ID4gPiArCj4gPiA+ID4gKwl2cmluZ19kZXNjX3QgKmRlc2M7Cj4gPiA+ID4g
Kwo+ID4gPiA+ICsJdnJpbmdfYXZhaWxfdCAqYXZhaWw7Cj4gPiA+ID4gKwo+ID4gPiA+ICsJdnJp
bmdfdXNlZF90ICp1c2VkOwo+ID4gPiA+ICt9Owo+ID4gPiA+ICsKPiA+ID4gPiAgICBzdGF0aWMg
aW5saW5lIHZvaWQgdnJpbmdfaW5pdChzdHJ1Y3QgdnJpbmcgKnZyLCB1bnNpZ25lZCBpbnQgbnVt
LCB2b2lkICpwLAo+ID4gPiA+ICAgIAkJCSAgICAgIHVuc2lnbmVkIGxvbmcgYWxpZ24pCj4gPiA+
ID4gICAgewoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
