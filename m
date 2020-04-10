Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 626CB1A439C
	for <lists.virtualization@lfdr.de>; Fri, 10 Apr 2020 10:38:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F2AA620552;
	Fri, 10 Apr 2020 08:38:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9gBOgjbn1DXd; Fri, 10 Apr 2020 08:38:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DD1F32052C;
	Fri, 10 Apr 2020 08:38:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BED97C1D87;
	Fri, 10 Apr 2020 08:38:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61CE0C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 08:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5E46987FFE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 08:38:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sxZsrNCKyxzT
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 08:38:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 76C9887E6E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 08:38:21 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id j20so512121otl.9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 01:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MnkBps5dPQbD4CG4QaaMY0Tz9mlnoTRC3JihBNqhQXY=;
 b=RWFXbPuGU2EIKtuluXvjUzrf3CEBiSAYnLS3ogfjrYQB/aSrso1QdhE7YjQwtGKKOg
 FR+cNtpmmQbh89cL2BjyScfpLlba/zyOIzyGTBU9BBlGUNB/ffl6pLHFYj9zbVmlaveS
 4Oc6+aVIk+A4h9wUyTOrJ/BQ5WIx9V5YeC/iWawhkSBAInKMGWE3b/w4eINh8l6cIsTX
 LDRz0FChd3STyjtSQkEflf2x2ArFFBORaBcM45OFeYz7WyKatLJ48flFrnOdCnI6r1Bh
 CjXPAI403DWPQU9d4AUFblWTNVLRXeqV0sL/OVpuk+vRjfuIFhn39RSMruNFFaxcpfB4
 5YKw==
X-Gm-Message-State: AGi0PubkScQi2W/0NnHHumhemho2s82rM8ekHvfhqbASpcPeo+qo3jKA
 NErcbWG9Dtmzymaoz8RroPdtnOptNl2ehlWDOJE=
X-Google-Smtp-Source: APiQypLnP7keBKAvie0PujLeMFsnmkZ0mKJXIJALd/RsE3W5pvReIq2ncUcbVYj/EB8mrfZKOiVOTBLRHrLTrROTy5E=
X-Received: by 2002:a4a:95a9:: with SMTP id o38mr3377628ooi.76.1586507900498; 
 Fri, 10 Apr 2020 01:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <git-mailbomb-linux-master-20c384f1ea1a0bc7320bc445c72dd02d2970d594@kernel.org>
 <CAMuHMdUkff8XUrbHa90nGxa8Kj3HO9b2CRO57s3YZrSFPM51pg@mail.gmail.com>
 <f7fc96d4-de8e-cdce-bd98-242cdade2843@redhat.com>
In-Reply-To: <f7fc96d4-de8e-cdce-bd98-242cdade2843@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Apr 2020 10:38:07 +0200
Message-ID: <CAMuHMdWcwtEaY9Dq5wpescGcj0Q1uYL=mg56ZQweXc4=DFXKKg@mail.gmail.com>
Subject: Re: vhost: refine vhost and vringh kconfig
To: Jason Wang <jasowang@redhat.com>
Cc: virtualization@lists.linux-foundation.org, KVM list <kvm@vger.kernel.org>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

SGkgSmFzb24sCgpPbiBGcmksIEFwciAxMCwgMjAyMCBhdCAxMDozMyBBTSBKYXNvbiBXYW5nIDxq
YXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToKPiBPbiAyMDIwLzQvMTAg5LiL5Y2IMzo1MywgR2Vl
cnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gT24gVGh1LCBBcHIgOSwgMjAyMCBhdCA2OjA0IEFN
IExpbnV4IEtlcm5lbCBNYWlsaW5nIExpc3QKPiA+IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnPiB3cm90ZToKPiA+PiBDb21taXQ6ICAgICAyMGMzODRmMWVhMWEwYmM3MzIwYmM0NDVjNzJk
ZDAyZDI5NzBkNTk0Cj4gPj4gUGFyZW50OiAgICAgNWE2YjRjYzViN2ExODkyYThkN2Y2M2Q2Y2Jh
YzZlMGFlMmE5ZDAzMQo+ID4+IFJlZm5hbWU6ICAgIHJlZnMvaGVhZHMvbWFzdGVyCj4gPj4gV2Vi
OiAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy90b3J2YWxkcy9jLzIwYzM4NGYxZWExYTBi
YzczMjBiYzQ0NWM3MmRkMDJkMjk3MGQ1OTQKPiA+PiBBdXRob3I6ICAgICBKYXNvbiBXYW5nIDxq
YXNvd2FuZ0ByZWRoYXQuY29tPgo+ID4+IEF1dGhvckRhdGU6IFRodSBNYXIgMjYgMjI6MDE6MTcg
MjAyMCArMDgwMAo+ID4+IENvbW1pdHRlcjogIE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhh
dC5jb20+Cj4gPj4gQ29tbWl0RGF0ZTogV2VkIEFwciAxIDEyOjA2OjI2IDIwMjAgLTA0MDAKPiA+
Pgo+ID4+ICAgICAgdmhvc3Q6IHJlZmluZSB2aG9zdCBhbmQgdnJpbmdoIGtjb25maWcKPiA+Pgo+
ID4+ICAgICAgQ3VycmVudGx5LCBDT05GSUdfVkhPU1QgZGVwZW5kcyBvbiBDT05GSUdfVklSVFVB
TElaQVRJT04uIEJ1dCB2aG9zdCBpcwo+ID4+ICAgICAgbm90IG5lY2Vzc2FyaWx5IGZvciBWTSBz
aW5jZSBpdCdzIGEgZ2VuZXJpYyB1c2Vyc3BhY2UgYW5kIGtlcm5lbAo+ID4+ICAgICAgY29tbXVu
aWNhdGlvbiBwcm90b2NvbC4gU3VjaCBkZXBlbmRlbmN5IG1heSBwcmV2ZW50IGFyY2hzIHdpdGhv
dXQKPiA+PiAgICAgIHZpcnR1YWxpemF0aW9uIHN1cHBvcnQgZnJvbSB1c2luZyB2aG9zdC4KPiA+
Pgo+ID4+ICAgICAgVG8gc29sdmUgdGhpcywgYSBkZWRpY2F0ZWQgdmhvc3QgbWVudSBpcyBjcmVh
dGVkIHVuZGVyIGRyaXZlcnMgc28KPiA+PiAgICAgIENPTklGR19WSE9TVCBjYW4gYmUgZGVjb3Vw
bGVkIG91dCBvZiBDT05GSUdfVklSVFVBTElaQVRJT04uCj4gPj4KPiA+PiAgICAgIFdoaWxlIGF0
IGl0LCBhbHNvIHNxdWFzaCBLY29uZmlnLnZyaW5naCBpbnRvIHZob3N0IEtjb25maWcgZmlsZS4g
VGhpcwo+ID4+ICAgICAgYXZvaWRzIHRoZSB0cmljayBvZiBjb25kaXRpb25hbCBpbmNsdXNpb24g
ZnJvbSBWT1Agb3IgQ0FJRi4gVGhlbiBpdAo+ID4+ICAgICAgd2lsbCBiZSBlYXNpZXIgdG8gaW50
cm9kdWNlIG5ldyB2cmluZ2ggdXNlcnMgYW5kIGNvbW1vbiBkZXBlbmRlbmN5IGZvcgo+ID4+ICAg
ICAgYm90aCB2cmluZ2ggYW5kIHZob3N0Lgo+ID4+Cj4gPj4gICAgICBTaWduZWQtb2ZmLWJ5OiBK
YXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+ID4+ICAgICAgTGluazogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvci8yMDIwMDMyNjE0MDEyNS4xOTc5NC0yLWphc293YW5nQHJlZGhhdC5j
b20KPiA+PiAgICAgIFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhh
dC5jb20+Cj4gPj4gLS0tCj4gPj4gICBhcmNoL2FybS9rdm0vS2NvbmZpZyAgICAgICAgIHwgIDIg
LS0KPiA+PiAgIGFyY2gvYXJtNjQva3ZtL0tjb25maWcgICAgICAgfCAgMiAtLQo+ID4+ICAgYXJj
aC9taXBzL2t2bS9LY29uZmlnICAgICAgICB8ICAyIC0tCj4gPj4gICBhcmNoL3Bvd2VycGMva3Zt
L0tjb25maWcgICAgIHwgIDIgLS0KPiA+PiAgIGFyY2gvczM5MC9rdm0vS2NvbmZpZyAgICAgICAg
fCAgNCAtLS0tCj4gPj4gICBhcmNoL3g4Ni9rdm0vS2NvbmZpZyAgICAgICAgIHwgIDQgLS0tLQo+
ID4+ICAgZHJpdmVycy9LY29uZmlnICAgICAgICAgICAgICB8ICAyICsrCj4gPj4gICBkcml2ZXJz
L21pc2MvbWljL0tjb25maWcgICAgIHwgIDQgLS0tLQo+ID4+ICAgZHJpdmVycy9uZXQvY2FpZi9L
Y29uZmlnICAgICB8ICA0IC0tLS0KPiA+PiAgIGRyaXZlcnMvdmhvc3QvS2NvbmZpZyAgICAgICAg
fCAyOCArKysrKysrKysrKysrKysrKysrKystLS0tLS0tCj4gPj4gICBkcml2ZXJzL3Zob3N0L0tj
b25maWcudnJpbmdoIHwgIDYgLS0tLS0tCj4gPj4gICAxMSBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNl
cnRpb25zKCspLCAzNyBkZWxldGlvbnMoLSkKPiA+PiAtLS0gYS9kcml2ZXJzL3Zob3N0L0tjb25m
aWcKPiA+PiArKysgYi9kcml2ZXJzL3Zob3N0L0tjb25maWcKPiA+PiBAQCAtMSw0ICsxLDIzIEBA
Cj4gPj4gICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPiA+PiArY29u
ZmlnIFZIT1NUX1JJTkcKPiA+PiArICAgICAgIHRyaXN0YXRlCj4gPj4gKyAgICAgICBoZWxwCj4g
Pj4gKyAgICAgICAgIFRoaXMgb3B0aW9uIGlzIHNlbGVjdGVkIGJ5IGFueSBkcml2ZXIgd2hpY2gg
bmVlZHMgdG8gYWNjZXNzCj4gPj4gKyAgICAgICAgIHRoZSBob3N0IHNpZGUgb2YgYSB2aXJ0aW8g
cmluZy4KPiA+PiArCj4gPj4gK2NvbmZpZyBWSE9TVAo+ID4+ICsgICAgICAgdHJpc3RhdGUKPiA+
PiArICAgICAgIHNlbGVjdCBWSE9TVF9JT1RMQgo+ID4+ICsgICAgICAgaGVscAo+ID4+ICsgICAg
ICAgICBUaGlzIG9wdGlvbiBpcyBzZWxlY3RlZCBieSBhbnkgZHJpdmVyIHdoaWNoIG5lZWRzIHRv
IGFjY2Vzcwo+ID4+ICsgICAgICAgICB0aGUgY29yZSBvZiB2aG9zdC4KPiA+PiArCj4gPj4gK21l
bnVjb25maWcgVkhPU1RfTUVOVQo+ID4+ICsgICAgICAgYm9vbCAiVkhPU1QgZHJpdmVycyIKPiA+
PiArICAgICAgIGRlZmF1bHQgeQo+ID4gUGxlYXNlIGRvIG5vdCB1c2UgZGVmYXVsdCB5LiBZb3Vy
IHN1YnN5c3RlbSBpcyBub3Qgc3BlY2lhbC4KPgo+Cj4gVGhpcyBpcyBiZWNhdXNlIGJlZm9yZSB0
aGlzIHBhdGNoIFZIT1NUIGRlcGVuZHMgb24gVklSVFVBTElaQVRJT04uIFNvCj4gdGhlIGFyY2hz
IHdob3NlIGRlZmNvbmZpZyB0aGF0IGhhcyBWSVJUVUFMSVpBVElPTiBjYW4ganVzdCBlbmFibGUg
ZS5nCj4gVkhPU1RfTkVUIHdpdGhvdXQgY2FyaW5nIGFib3V0IFZIT1NUX01FTlUuCj4KPiBJZiB0
aGlzIGlzIG5vdCBwcmVmZXJhYmxlLCB3ZSBjYW46Cj4KPiAxKSBtb2RpZnkgdGhlIGRlZmNvbmZp
ZyBhbmQgZW5hYmxlIFZIT1NUX01FTlUgdGhlcmUKPiAyKSBzd2l0Y2ggdG8gdXNlIGRlZmF1bHQg
eSBpZiAkKGFsbF9hcmNoc190aGF0X2hhc19WSVJUVUFMSVpBVElPTikKCkkgdGhpbmsgdXBkYXRp
bmcgdGhlIGZldyAoMSkgZGVmY29uZmlncyBpcyBwcmVmZXJhYmxlLgpFbHNlIHlvdSBwdXQgdGhl
IGJ1cmRlbiBvbiB0aGUgbWFpbnRhaW5lcnMgb2YgYWxsIHRoZSBvdGhlciAoKzQwMCkKZGVmY29u
Zmlncywgd2hpY2ggd2lsbCBoYXZlIHRvIGFkZCAiQ09ORklHX1ZIT1NUX01FTlUgaXMgbm90IHNl
dCIuCgo+ID4gSSB0aGluayB0aGlzIGRlc2VydmVzIGEgaGVscCB0ZXh0LCBzbyB1c2VycyBrbm93
IGlmIHRoZXkgd2FudCB0byBlbmFibGUgdGhpcwo+ID4gb3B0aW9uIG9yIG5vdC4KPgo+IFdpbGwg
YWRkIG9uZS4KClRoYW5rcyEKCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
