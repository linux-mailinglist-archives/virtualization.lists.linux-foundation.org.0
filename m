Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E451C06A8
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 21:43:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 994278800D;
	Thu, 30 Apr 2020 19:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PgZxPoQmRSVA; Thu, 30 Apr 2020 19:43:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 064A188020;
	Thu, 30 Apr 2020 19:43:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7866C016F;
	Thu, 30 Apr 2020 19:43:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41758C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 19:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 34C4A87F35
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 19:43:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ew4RI6mf6Zhv
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 19:43:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E45ED87720
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 19:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588275790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=goZrpEqp3iJA4lm/Yersej+JnT7xdVa2cM94+kQqyoY=;
 b=YLqxw6GHDj6VlGQ4kgtOcdHa72ILb1R2nwwv7yFkU22H6LJvpwfHbwmTg7I8EGdJz7GLHp
 HlgGVI+IlPDVcncgXsIGTfiZ4Hr7pKXZg9RWq0kJpiO2kV4LV4Pfilbe45eeDJE9xCxXeZ
 M4JYKT84stmVavwOzB0o8rd1RglXaOM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-e7QslLQSO8qYsqzr1C87kw-1; Thu, 30 Apr 2020 15:43:06 -0400
X-MC-Unique: e7QslLQSO8qYsqzr1C87kw-1
Received: by mail-wr1-f71.google.com with SMTP id o8so4383201wrm.11
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 12:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=goZrpEqp3iJA4lm/Yersej+JnT7xdVa2cM94+kQqyoY=;
 b=MHONP/BC+s4PBEck3dY/8iDboy4i9t9xBEikWJWV115u/ixd7B2Dni5SJbXHD9wtAK
 G75NoEMlViqNLLxUr4Tx0JOBQrnoDmY4k2hg7h+EDSikgkyXksaWwo+rQPuIrcZEu/+y
 PALJT+upbN7y6/eubGnhH0Pz8mbhF9a4XasTLBvAmSA0pOniw0xqvA9VvqMGmH1au7Kp
 3JCXxZJM+vMfi1/CbQjjpcagzegd7nBuMeqUfTHBJDPeDusSiso38KiC6hzLts1/AMPG
 cNP0z76BAhPWAdTKXRhL8fU3XUgn7RCiJu7/y90slSXtxdUiJwzd2SmGyxZaLz3T5ZAe
 BbYw==
X-Gm-Message-State: AGi0PuZdBcybqtXdmevm3SB57XnpWwFRl/N06INECOnyRwI80v1CYXGP
 Q935H8vCx2f22y+PHA7j4iDralKTgpI9ZuVMKJQhfrPyGLJ+AjfdtlDjhkoLEaB8mSHYro+l6A9
 mkluUsnSqZdZkQ78OsSgdTNvKvaD93P952McrkXJQ7g==
X-Received: by 2002:adf:ff82:: with SMTP id j2mr212145wrr.96.1588275784220;
 Thu, 30 Apr 2020 12:43:04 -0700 (PDT)
X-Google-Smtp-Source: APiQypJP4633C/my4n/K8zqJjQ2v4iHZ/3Ga7TQmDfKlaDhXNPhcVGMIgFpD+nIhpUi8UUTY1AEZNw==
X-Received: by 2002:adf:ff82:: with SMTP id j2mr212131wrr.96.1588275783996;
 Thu, 30 Apr 2020 12:43:03 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 h6sm797729wmf.31.2020.04.30.12.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 12:43:03 -0700 (PDT)
Date: Thu, 30 Apr 2020 15:43:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] vhost: vsock: don't send pkt when vq is not started
Message-ID: <20200430153929-mutt-send-email-mst@kernel.org>
References: <20200430021314.6425-1-justin.he@arm.com>
 <20200430082608.wbtqgglmtnd7e5ci@steredhat>
 <AM6PR08MB4069D4AB611B8C8180DC4B9CF7AA0@AM6PR08MB4069.eurprd08.prod.outlook.com>
 <20200430162521.k4b4t3vttfabgqal@steredhat>
MIME-Version: 1.0
In-Reply-To: <20200430162521.k4b4t3vttfabgqal@steredhat>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Justin He <Justin.He@arm.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Kaly Xin <Kaly.Xin@arm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
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

T24gVGh1LCBBcHIgMzAsIDIwMjAgYXQgMDY6MjU6MjFQTSArMDIwMCwgU3RlZmFubyBHYXJ6YXJl
bGxhIHdyb3RlOgo+IE9uIFRodSwgQXByIDMwLCAyMDIwIGF0IDEwOjA2OjI2QU0gKzAwMDAsIEp1
c3RpbiBIZSB3cm90ZToKPiA+IEhpIFN0ZWZhbm8KPiA+IAo+ID4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQo+ID4gPiBGcm9tOiBTdGVmYW5vIEdhcnphcmVsbGEgPHNnYXJ6YXJlQHJlZGhh
dC5jb20+Cj4gPiA+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAzMCwgMjAyMCA0OjI2IFBNCj4gPiA+
IFRvOiBKdXN0aW4gSGUgPEp1c3Rpbi5IZUBhcm0uY29tPgo+ID4gPiBDYzogU3RlZmFuIEhham5v
Y3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPjsgTWljaGFlbCBTLiBUc2lya2luCj4gPiA+IDxtc3RA
cmVkaGF0LmNvbT47IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Owo+ID4gPiBrdm1A
dmdlci5rZXJuZWwub3JnOyB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZzsKPiA+ID4gbmV0ZGV2QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgS2FseSBYaW4KPiA+ID4gPEthbHkuWGluQGFybS5jb20+Cj4gPiA+IFN1YmplY3Q6IFJl
OiBbUEFUQ0hdIHZob3N0OiB2c29jazogZG9uJ3Qgc2VuZCBwa3Qgd2hlbiB2cSBpcyBub3Qgc3Rh
cnRlZAo+ID4gPgo+ID4gPiBIaSBKaWEsCj4gPiA+IHRoYW5rcyBmb3IgdGhlIHBhdGNoLCBzb21l
IGNvbW1lbnRzIGJlbG93Ogo+ID4gPgo+ID4gPiBPbiBUaHUsIEFwciAzMCwgMjAyMCBhdCAxMDox
MzoxNEFNICswODAwLCBKaWEgSGUgd3JvdGU6Cj4gPiA+ID4gTmluZyBCbyByZXBvcnRlZCBhbiBh
Ym5vcm1hbCAyLXNlY29uZCBnYXAgd2hlbiBib290aW5nIEthdGEgY29udGFpbmVyCj4gPiA+IFsx
XS4KPiA+ID4gPiBUaGUgdW5jb25kaXRpb25hbCB0aW1lb3V0IGlzIGNhdXNlZCBieQo+ID4gPiBW
U09DS19ERUZBVUxUX0NPTk5FQ1RfVElNRU9VVCBvZgo+ID4gPiA+IGNvbm5lY3QgYXQgY2xpZW50
IHNpZGUuIFRoZSB2aG9zdCB2c29jayBjbGllbnQgdHJpZXMgdG8gY29ubmVjdCBhbgo+ID4gPiA+
IGluaXRsaXppbmcgdmlydGlvIHZzb2NrIHNlcnZlci4KPiA+ID4gPgo+ID4gPiA+IFRoZSBhYm5v
cm1hbCBmbG93IGxvb2tzIGxpa2U6Cj4gPiA+ID4gaG9zdC11c2Vyc3BhY2UgICAgICAgICAgIHZo
b3N0IHZzb2NrICAgICAgICAgICAgICAgICAgICAgICBndWVzdCB2c29jawo+ID4gPiA+ID09PT09
PT09PT09PT09ICAgICAgICAgICA9PT09PT09PT09PSAgICAgICAgICAgICAgICAgICAgICAgPT09
PT09PT09PT09Cj4gPiA+ID4gY29ubmVjdCgpICAgICAtLS0tLS0tLT4gIHZob3N0X3RyYW5zcG9y
dF9zZW5kX3BrdF93b3JrKCkgICBpbml0aWFsaXppbmcKPiA+ID4gPiAgICB8ICAgICAgICAgICAg
ICAgICAgICAgdnEtPnByaXZhdGVfZGF0YT09TlVMTAo+ID4gPiA+ICAgIHwgICAgICAgICAgICAg
ICAgICAgICB3aWxsIG5vdCBiZSBxdWV1ZWQKPiA+ID4gPiAgICBWCj4gPiA+ID4gc2NoZWR1bGVf
dGltZW91dCgycykKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgdmhvc3RfdnNvY2tf
c3RhcnQoKSAgPC0tLS0tLS0tLSAgIGRldmljZSByZWFkeQo+ID4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICBzZXQgdnEtPnByaXZhdGVfZGF0YQo+ID4gPiA+Cj4gPiA+ID4gd2FpdCBmb3Ig
MnMgYW5kIGZhaWxlZAo+ID4gPiA+Cj4gPiA+ID4gY29ubmVjdCgpIGFnYWluICAgICAgICAgIHZx
LT5wcml2YXRlX2RhdGEhPU5VTEwgICAgICAgICAgcmVjdiBjb25uZWN0aW5nIHBrdAo+ID4gPiA+
Cj4gPiA+ID4gMS4gaG9zdCB1c2Vyc3BhY2Ugc2VuZHMgYSBjb25uZWN0IHBrdCwgYXQgdGhhdCB0
aW1lLCBndWVzdCB2c29jayBpcyB1bmRlcgo+ID4gPiA+IGluaXRpYWxpemluZywgaGVuY2UgdGhl
IHZob3N0X3Zzb2NrX3N0YXJ0IGhhcyBub3QgYmVlbiBjYWxsZWQuIFNvCj4gPiA+ID4gdnEtPnBy
aXZhdGVfZGF0YT09TlVMTCwgYW5kIHRoZSBwa3QgaXMgbm90IGJlZW4gcXVldWVkIHRvIHNlbmQg
dG8gZ3Vlc3QuCj4gPiA+ID4gMi4gdGhlbiBpdCBzbGVlcHMgZm9yIDJzCj4gPiA+ID4gMy4gYWZ0
ZXIgZ3Vlc3QgdnNvY2sgZmluaXNoZXMgaW5pdGlhbGl6aW5nLCB2cS0+cHJpdmF0ZV9kYXRhIGlz
IHNldC4KPiA+ID4gPiA0LiBXaGVuIGhvc3QgdXNlcnNwYWNlIHdha2VzIHVwIGFmdGVyIDJzLCBz
ZW5kIGNvbm5lY3RpbmcgcGt0IGFnYWluLAo+ID4gPiA+IGV2ZXJ5dGhpbmcgaXMgZmluZS4KPiA+
ID4gPgo+ID4gPiA+IFRoaXMgZml4ZXMgaXQgYnkgY2hlY2tpbmcgdnEtPnByaXZhdGVfZGF0YSBp
biB2aG9zdF90cmFuc3BvcnRfc2VuZF9wa3QsCj4gPiA+ID4gYW5kIHJldHVybiBhdCBvbmNlIGlm
ICF2cS0+cHJpdmF0ZV9kYXRhLiBUaGlzIG1ha2VzIHVzZXIgY29ubmVjdCgpCj4gPiA+ID4gYmUg
cmV0dXJuZWQgd2l0aCBFQ09OTlJFRlVTRUQuCj4gPiA+ID4KPiA+ID4gPiBBZnRlciB0aGlzIHBh
dGNoLCBrYXRhLXJ1bnRpbWUgKHdpdGggdnNvY2sgZW5hYmxlZCkgYm9vdHRpbWUgcmVkdWNlcyBm
cm9tCj4gPiA+ID4gM3MgdG8gMXMgb24gVGh1bmRlclgyIGFybTY0IHNlcnZlci4KPiA+ID4gPgo+
ID4gPiA+IFsxXSBodHRwczovL2dpdGh1Yi5jb20va2F0YS1jb250YWluZXJzL3J1bnRpbWUvaXNz
dWVzLzE5MTcKPiA+ID4gPgo+ID4gPiA+IFJlcG9ydGVkLWJ5OiBOaW5nIEJvIDxuLmJAbGl2ZS5j
b20+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSmlhIEhlIDxqdXN0aW4uaGVAYXJtLmNvbT4KPiA+
ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy92aG9zdC92c29jay5jIHwgOCArKysrKysrKwo+ID4g
PiA+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4gPiA+ID4KPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aG9zdC92c29jay5jIGIvZHJpdmVycy92aG9zdC92c29jay5jCj4g
PiA+ID4gaW5kZXggZTM2YWFmOWJhN2JkLi42NzQ3NDMzNGRkODggMTAwNjQ0Cj4gPiA+ID4gLS0t
IGEvZHJpdmVycy92aG9zdC92c29jay5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy92aG9zdC92c29j
ay5jCj4gPiA+ID4gQEAgLTI0MSw2ICsyNDEsNyBAQCB2aG9zdF90cmFuc3BvcnRfc2VuZF9wa3Qo
c3RydWN0IHZpcnRpb192c29ja19wa3QKPiA+ID4gKnBrdCkKPiA+ID4gPiAgewo+ID4gPiA+ICBz
dHJ1Y3Qgdmhvc3RfdnNvY2sgKnZzb2NrOwo+ID4gPiA+ICBpbnQgbGVuID0gcGt0LT5sZW47Cj4g
PiA+ID4gK3N0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxOwo+ID4gPiA+Cj4gPiA+ID4gIHJjdV9y
ZWFkX2xvY2soKTsKPiA+ID4gPgo+ID4gPiA+IEBAIC0yNTIsNiArMjUzLDEzIEBAIHZob3N0X3Ry
YW5zcG9ydF9zZW5kX3BrdChzdHJ1Y3QgdmlydGlvX3Zzb2NrX3BrdAo+ID4gPiAqcGt0KQo+ID4g
PiA+ICByZXR1cm4gLUVOT0RFVjsKPiA+ID4gPiAgfQo+ID4gPiA+Cj4gPiA+ID4gK3ZxID0gJnZz
b2NrLT52cXNbVlNPQ0tfVlFfUlhdOwo+ID4gPiA+ICtpZiAoIXZxLT5wcml2YXRlX2RhdGEpIHsK
PiA+ID4KPiA+ID4gSSB0aGluayBpcyBiZXR0ZXIgdG8gdXNlIHZob3N0X3ZxX2dldF9iYWNrZW5k
KCk6Cj4gPiA+Cj4gPiA+IGlmICghdmhvc3RfdnFfZ2V0X2JhY2tlbmQoJnZzb2NrLT52cXNbVlNP
Q0tfVlFfUlhdKSkgewo+ID4gPiAuLi4KPiA+ID4KPiA+ID4gVGhpcyBmdW5jdGlvbiBzaG91bGQg
YmUgY2FsbGVkIHdpdGggJ3ZxLT5tdXRleCcgYWNxdWlyZWQgYXMgZXhwbGFpbmVkIGluCj4gPiA+
IHRoZSBjb21tZW50LCBidXQgaGVyZSB3ZSBjYW4gYXZvaWQgdGhhdCwgYmVjYXVzZSB3ZSBhcmUg
bm90IHVzaW5nIHRoZSB2cSwKPiA+ID4gc28gaXQgaXMgc2FmZSwgYmVjYXVzZSBpbiB2aG9zdF90
cmFuc3BvcnRfZG9fc2VuZF9wa3QoKSB3ZSBjaGVjayBpdCBhZ2Fpbi4KPiA+ID4KPiA+ID4gUGxl
YXNlIGFkZCBhIGNvbW1lbnQgZXhwbGFpbmluZyB0aGF0Lgo+ID4gPgo+ID4gCj4gPiBUaGFua3Ms
IHZob3N0X3ZxX2dldF9iYWNrZW5kIGlzIGJldHRlci4gSSBjaG9zZSBhIDUuMyBrZXJuZWwgdG8g
ZGV2ZWxvcAo+ID4gYW5kIG1pc3NlZCB0aGlzIGhlbHBlci4KPiAKPiA6LSkKPiAKPiA+ID4KPiA+
ID4gQXMgYW4gYWx0ZXJuYXRpdmUgdG8gdGhpcyBwYXRjaCwgc2hvdWxkIHdlIGtpY2sgdGhlIHNl
bmQgd29ya2VyIHdoZW4gdGhlCj4gPiA+IGRldmljZSBpcyByZWFkeT8KPiA+ID4KPiA+ID4gSUlV
QyB3ZSByZWFjaCB0aGUgdGltZW91dCBiZWNhdXNlIHRoZSBzZW5kIHdvcmtlciAodGhhdCBydW5z
Cj4gPiA+IHZob3N0X3RyYW5zcG9ydF9kb19zZW5kX3BrdCgpKSBleGl0cyBpbW1lZGlhdGVseSBz
aW5jZSAndnEtPnByaXZhdGVfZGF0YScKPiA+ID4gaXMgTlVMTCwgYW5kIG5vIG9uZSB3aWxsIHJl
cXVldWUgaXQuCj4gPiA+Cj4gPiA+IExldCdzIGRvIGl0IHdoZW4gd2Uga25vdyB0aGUgZGV2aWNl
IGlzIHJlYWR5Ogo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92c29jay5j
IGIvZHJpdmVycy92aG9zdC92c29jay5jCj4gPiA+IGluZGV4IGUzNmFhZjliYTdiZC4uMjk1YjU4
Njc5NDRmIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3Zob3N0L3Zzb2NrLmMKPiA+ID4gKysr
IGIvZHJpdmVycy92aG9zdC92c29jay5jCj4gPiA+IEBAIC01NDMsNiArNTQzLDExIEBAIHN0YXRp
YyBpbnQgdmhvc3RfdnNvY2tfc3RhcnQoc3RydWN0IHZob3N0X3Zzb2NrCj4gPiA+ICp2c29jaykK
PiA+ID4gICAgICAgICAgICAgICAgIG11dGV4X3VubG9jaygmdnEtPm11dGV4KTsKPiA+ID4gICAg
ICAgICB9Cj4gPiA+Cj4gPiA+ICsgICAgICAgLyogU29tZSBwYWNrZXRzIG1heSBoYXZlIGJlZW4g
cXVldWVkIGJlZm9yZSB0aGUgZGV2aWNlIHdhcyBzdGFydGVkLAo+ID4gPiArICAgICAgICAqIGxl
dCdzIGtpY2sgdGhlIHNlbmQgd29ya2VyIHRvIHNlbmQgdGhlbS4KPiA+ID4gKyAgICAgICAgKi8K
PiA+ID4gKyAgICAgICB2aG9zdF93b3JrX3F1ZXVlKCZ2c29jay0+ZGV2LCAmdnNvY2stPnNlbmRf
cGt0X3dvcmspOwo+ID4gPiArCj4gPiBZZXMsIGl0IHdvcmtzLgo+ID4gQnV0IGRvIHlvdSB0aGlu
ayBhIHRocmVzaG9sZCBzaG91bGQgYmUgc2V0IGhlcmUgdG8gcHJldmVudCB0aGUgcXVldWUKPiA+
IGZyb20gYmVpbmcgdG9vIGxvbmc/IEUuZy4gdGhlIGNsaWVudCB1c2VyIHNlbmRzIHRvbyBtYW55
IGNvbm5lY3QgcGt0cwo+ID4gaW4gYSBzaG9ydCB0aW1lIGJlZm9yZSB0aGUgc2VydmVyIGlzIGNv
bXBsZXRlbHkgcmVhZHkuCj4gCj4gV2hlbiB0aGUgdXNlciBjYWxsIHRoZSBjb25uZWN0KCkgdGhl
IHNvY2tldCBzdGF0dXMgaXMgbW92ZWQgdG8KPiBTU19DT05ORUNUSU5HIChzZWUgbmV0L3Ztd192
c29jay9hZl92c29jay5jKSwgc28gYW5vdGhlciBjb25uZWN0KCkgb24KPiB0aGUgc2FtZSBzb2Nr
ZXQgd2lsbCByZWNlaXZlIEVBTFJFQURZIGVycm9yLgo+IAo+IElmIHRoZSB1c2VyIHVzZXMgbXVs
dGlwbGUgc29ja2V0cywgdGhlIHNvY2tldCBsYXllciBhbHJlYWR5IGNoZWNrIGZvcgo+IGFueSBs
aW1pdHMsIHNvIEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIHB1dCBhIHRocmVzaG9sZCBoZXJlLgo+
IAo+ID4gCj4gPiA+ICAgICAgICAgbXV0ZXhfdW5sb2NrKCZ2c29jay0+ZGV2Lm11dGV4KTsKPiA+
ID4gICAgICAgICByZXR1cm4gMDsKPiA+ID4KPiA+ID4gSSBkaWRuJ3QgdGVzdCBpdCwgY2FuIHlv
dSB0cnkgaWYgaXQgZml4ZXMgdGhlIGlzc3VlPwo+ID4gPgo+ID4gPiBJJ20gbm90IHN1cmUgd2hp
Y2ggaXMgYmV0dGVyLi4uCj4gPiBJIGRvbid0IGtub3csIGVpdGhlci4gV2FpdCBmb3IgbW9yZSBj
b21tZW50cyDwn5iKCj4gCj4gSSBwcmVmZXIgdGhlIHNlY29uZCBvcHRpb24sIGJlY2F1c2UgdGhl
IGRldmljZSBpcyBpbiBhIHRyYW5zaXRpb25hbAo+IHN0YXRlIGFuZCBhIGNvbm5lY3QgY2FuIGJs
b2NrIChmb3IgYXQgbW9zdCB0d28gc2Vjb25kcykgdW50aWwgdGhlIGRldmljZSBpcwo+IHN0YXJ0
ZWQuCj4gCj4gRm9yIHRoZSBmaXJzdCBvcHRpb24sIEknbSBhbHNvIG5vdCBzdXJlIGlmIEVDT05O
UkVGVVNFRCBpcyB0aGUgcmlnaHQgZXJyb3IKPiB0byByZXR1cm4sIG1heWJlIGlzIGJldHRlciBF
TkVUVU5SRUFDSC4KPiAKPiBDaGVlcnMsCj4gU3RlZmFubwoKSUlSQzoKCkVDT05OUkVGVVNFRCBp
cyB3aGF0IG9uZSBnZXRzIHdoZW4gY29ubmVjdGluZyB0byByZW1vdGUgYSBwb3J0IHdoaWNoIGRv
ZXMgbm90CnlldCBoYXZlIGEgbGlzdGVuaW5nIHNvY2tldCwgc28gcmVtb3RlIHNlbmRzIGJhY2sg
UlNULgpFTkVUVU5SRUFDSCBpcyB3aGVuIGxvY2FsIG5ldHdvcmsncyBkb3duLCBzbyB5b3UgY2Fu
J3QgZXZlbiBzZW5kIGEKY29ubmVjdGlvbiByZXF1ZXN0LgpFSE9TVFVOUkVBQ0ggaXMgcmVtb3Rl
IG5ldHdvcmsgaXMgZG93bi4KCi0tIApNU1QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
