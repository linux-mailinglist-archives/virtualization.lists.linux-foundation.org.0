Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F67234385
	for <lists.virtualization@lfdr.de>; Tue,  4 Jun 2019 11:50:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5C25ED39;
	Tue,  4 Jun 2019 09:50:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 062D7D13
	for <virtualization@lists.linux-foundation.org>;
	Tue,  4 Jun 2019 09:50:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [85.118.1.10])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E795D854
	for <virtualization@lists.linux-foundation.org>;
	Tue,  4 Jun 2019 09:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3k/+hinVCOAW7PyAk4gGWRix3vBPUw0AszrhY/mQ3ZU=;
	b=c43fmGuydsUZF63gosC+IZttlH
	gYzXBa8/0V4uVej1GzWEfMdi2xsydIvFd4tLBw+bv5HsldVLWQpvBcl2DkCU8yEkZ3PpnBYigbxPy
	aJIPOI/kE6ARXFCY1s5KfQX2iWaMACSu0pb5sUT6WRNnaSYW3Q/O3/Uowzws4daSoi9dcPsmsSY2l
	VX04lJI0KYglAeJjvFrz+UFSQLllkCQ53CYPXVg36kjtzR1mDsSFjNm9hkWBnUY5w3LhWk+QfvoOT
	XtTwuQYDFsrF/nEh1fnH19V8Vx4DlTvLBA8VAJkQ8nL7ezVvWeKU28nLcOpjX2tHNEltz/jrED1vA
	JHOrPT3Q==;
Received: from [187.113.6.249] (helo=coco.lan)
	by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hY61q-0004kh-OZ; Tue, 04 Jun 2019 09:46:51 +0000
Date: Tue, 4 Jun 2019 06:46:14 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH 22/22] docs: fix broken documentation links
Message-ID: <20190604064614.67cde821@coco.lan>
In-Reply-To: <64e136de-1a7b-3436-9675-44ea9fa7b64a@c-s.fr>
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
	<f9fecacbe4ce0b2b3aed38d71ae3753f2daf3ce3.1559171394.git.mchehab+samsung@kernel.org>
	<64e136de-1a7b-3436-9675-44ea9fa7b64a@c-s.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Thomas Preston <thomas.preston@codethink.co.uk>,
	Wolfram Sang <wsa@the-dreams.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
	Paul Mackerras <paulus@samba.org>,
	Alessia Mantegazza <amantegazza@vaga.pv.it>, Jakub Wilk <jwilk@jwilk.net>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	James Morris <jmorris@namei.org>, linux-acpi@vger.kernel.org,
	Andy Gross <agross@kernel.org>, xen-devel@lists.xenproject.org,
	Alexander Popov <alex.popov@linux.com>, Qian Cai <cai@lca.pw>,
	Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Kairui Song <kasong@redhat.com>,
	Quentin Perret <quentin.perret@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
	Jiri Kosina <jkosina@suse.cz>, Casey Schaufler <casey@schaufler-ca.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lu Baolu <baolu.lu@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>,
	Feng Tang <feng.tang@intel.com>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Yannik Sembritzki <yannik@sembritzki.me>,
	Harry Wei <harryxiyou@gmail.com>, linux-i2c@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
	"Paul E. McKenney" <paulmck@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>, YueHaibing <yuehaibing@huawei.com>,
	Robert Moore <robert.moore@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Len Brown <lenb@kernel.org>, David Brown <david.brown@linaro.org>,
	Joerg Roedel <jroedel@suse.de>, linux-arm-msm@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@infradead.org>, linux-gpio@vger.kernel.org,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
	Sean Christopherson <sean.j.christopherson@intel.com>,
	Rob Herring <robh+dt@kernel.org>, James Morse <james.morse@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	linux-pci@vger.kernel.org, Bhupesh Sharma <bhsharma@redhat.com>,
	Josh Poimboeuf <jpoimboe@redhat.com>, platform-driver-x86@vger.kernel.org,
	Ding Xiang <dingxiang@cmss.chinamobile.com>,
	linux-kselftest@vger.kernel.org, Alex Shi <alex.shi@linux.alibaba.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Raphael Gault <raphael.gault@arm.com>, Joel Stanley <joel@jms.id.au>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Darren Hart <dvhart@infradead.org>,
	Erik Schmauss <erik.schmauss@intel.com>,
	"Serge E. Hallyn" <serge@hallyn.com>, Palmer Dabbelt <palmer@sifive.com>,
	Kees Cook <keescook@chromium.org>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Jonathan =?UTF-8?B?TmV1c2No?= =?UTF-8?B?w6RmZXI=?=
	<j.neuschaefer@gmx.net>, SeongJae Park <sj38.park@gmail.com>,
	Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	virtualization@lists.linux-foundation.org, devel@acpica.org,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Olof Johansson <olof@lixom.net>, Logan Gunthorpe <logang@deltatee.com>,
	"David S. Miller" <davem@davemloft.net>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Sven Van Asbroeck <thesven73@gmail.com>,
	Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
	"H. Peter Anvin" <hpa@zytor.com>, devel@driverdev.osuosl.org,
	Manfred Spraul <manfred@colorfullife.com>,
	Luis Chamberlain <mcgrof@kernel.org>, x86@kernel.org,
	Pavel Tatashin <pasha.tatashin@oracle.com>,
	Mike Rapoport <rppt@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>, Dave Young <dyoung@redhat.com>,
	devicetree@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>,
	Jerome Glisse <jglisse@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dmitry Vyukov <dvyukov@google.com>, linux-edac@vger.kernel.org,
	Juergen Gross <jgross@suse.com>,
	Denis Efremov <efremov@ispras.ru>, netdev@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Changbin Du <changbin.du@intel.com>, linux-security-module@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, Andy Shevchenko <andy@infradead.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

RW0gTW9uLCAzIEp1biAyMDE5IDA5OjM0OjE1ICswMjAwCkNocmlzdG9waGUgTGVyb3kgPGNocmlz
dG9waGUubGVyb3lAYy1zLmZyPiBlc2NyZXZldToKCj4gTGUgMzAvMDUvMjAxOSDDoCAwMToyMywg
TWF1cm8gQ2FydmFsaG8gQ2hlaGFiIGEgw6ljcml0wqA6Cj4gPiBNb3N0bHkgZHVlIHRvIHg4NiBh
bmQgYWNwaSBjb252ZXJzaW9uLCBzZXZlcmFsIGRvY3VtZW50YXRpb24KPiA+IGxpbmtzIGFyZSBz
dGlsbCBwb2ludGluZyB0byB0aGUgb2xkIGZpbGUuIEZpeCB0aGVtLgo+ID4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3Jn
Pgo+ID4gLS0tCj4gPiAgIERvY3VtZW50YXRpb24vYWNwaS9kc2QvbGVkcy50eHQgICAgICAgICAg
ICAgICAgICB8ICAyICstCj4gPiAgIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBh
cmFtZXRlcnMucnN0ICB8ICA2ICsrKy0tLQo+ID4gICBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRl
L2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCAgfCAxNiArKysrKysrKy0tLS0tLS0tCj4gPiAgIERvY3Vt
ZW50YXRpb24vYWRtaW4tZ3VpZGUvcmFzLnJzdCAgICAgICAgICAgICAgICB8ICAyICstCj4gPiAg
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9mc2wtZW5ldGMudHh0ICAgICAgICB8ICA3ICsr
Ky0tLS0KPiA+ICAgLi4uL2JpbmRpbmdzL3BjaS9hbWxvZ2ljLG1lc29uLXBjaWUudHh0ICAgICAg
ICAgIHwgIDIgKy0KPiA+ICAgLi4uL2JpbmRpbmdzL3JlZ3VsYXRvci9xY29tLHJwbWgtcmVndWxh
dG9yLnR4dCAgIHwgIDIgKy0KPiA+ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jvb3Rpbmct
d2l0aG91dC1vZi50eHQgIHwgIDIgKy0KPiA+ICAgRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2dw
aW8vYm9hcmQucnN0ICAgICAgICAgIHwgIDIgKy0KPiA+ICAgRG9jdW1lbnRhdGlvbi9kcml2ZXIt
YXBpL2dwaW8vY29uc3VtZXIucnN0ICAgICAgIHwgIDIgKy0KPiA+ICAgLi4uL2Zpcm13YXJlLWd1
aWRlL2FjcGkvZW51bWVyYXRpb24ucnN0ICAgICAgICAgIHwgIDIgKy0KPiA+ICAgLi4uL2Zpcm13
YXJlLWd1aWRlL2FjcGkvbWV0aG9kLXRyYWNpbmcucnN0ICAgICAgIHwgIDIgKy0KPiA+ICAgRG9j
dW1lbnRhdGlvbi9pMmMvaW5zdGFudGlhdGluZy1kZXZpY2VzICAgICAgICAgIHwgIDIgKy0KPiA+
ICAgRG9jdW1lbnRhdGlvbi9zeXNjdGwva2VybmVsLnR4dCAgICAgICAgICAgICAgICAgIHwgIDQg
KystLQo+ID4gICAuLi4vdHJhbnNsYXRpb25zL2l0X0lUL3Byb2Nlc3MvaG93dG8ucnN0ICAgICAg
ICAgfCAgMiArLQo+ID4gICAuLi4vaXRfSVQvcHJvY2Vzcy9zdGFibGUta2VybmVsLXJ1bGVzLnJz
dCAgICAgICAgfCAgNCArKy0tCj4gPiAgIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vcHJvY2Vzcy80
LkNvZGluZy5yc3QgICAgICB8ICAyICstCj4gPiAgIERvY3VtZW50YXRpb24veDg2L3g4Nl82NC81
bGV2ZWwtcGFnaW5nLnJzdCAgICAgICB8ICAyICstCj4gPiAgIERvY3VtZW50YXRpb24veDg2L3g4
Nl82NC9ib290LW9wdGlvbnMucnN0ICAgICAgICB8ICA0ICsrLS0KPiA+ICAgLi4uL3g4Ni94ODZf
NjQvZmFrZS1udW1hLWZvci1jcHVzZXRzLnJzdCAgICAgICAgIHwgIDIgKy0KPiA+ICAgTUFJTlRB
SU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKysrLS0tCj4g
PiAgIGFyY2gvYXJtL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAy
ICstCj4gPiAgIGFyY2gvYXJtNjQva2VybmVsL2tleGVjX2ltYWdlLmMgICAgICAgICAgICAgICAg
ICB8ICAyICstCj4gPiAgIGFyY2gvcG93ZXJwYy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyICstCj4gPiAgIGFyY2gveDg2L0tjb25maWcgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDE2ICsrKysrKysrLS0tLS0tLS0KPiA+ICAgYXJjaC94ODYvS2NvbmZp
Zy5kZWJ1ZyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiA+ICAgYXJjaC94ODYv
Ym9vdC9oZWFkZXIuUyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiA+ICAgYXJj
aC94ODYvZW50cnkvZW50cnlfNjQuUyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiA+
ICAgYXJjaC94ODYvaW5jbHVkZS9hc20vYm9vdHBhcmFtX3V0aWxzLmggICAgICAgICAgIHwgIDIg
Ky0KPiA+ICAgYXJjaC94ODYvaW5jbHVkZS9hc20vcGFnZV82NF90eXBlcy5oICAgICAgICAgICAg
IHwgIDIgKy0KPiA+ICAgYXJjaC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZV82NF90eXBlcy5oICAg
ICAgICAgIHwgIDIgKy0KPiA+ICAgYXJjaC94ODYva2VybmVsL2NwdS9taWNyb2NvZGUvYW1kLmMg
ICAgICAgICAgICAgIHwgIDIgKy0KPiA+ICAgYXJjaC94ODYva2VybmVsL2tleGVjLWJ6aW1hZ2U2
NC5jICAgICAgICAgICAgICAgIHwgIDIgKy0KPiA+ICAgYXJjaC94ODYva2VybmVsL3BjaS1kbWEu
YyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiA+ICAgYXJjaC94ODYvbW0vdGxiLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiA+ICAgYXJjaC94ODYvcGxh
dGZvcm0vcHZoL2VubGlnaHRlbi5jICAgICAgICAgICAgICAgIHwgIDIgKy0KPiA+ICAgZHJpdmVy
cy9hY3BpL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTAgKysrKystLS0t
LQo+ID4gICBkcml2ZXJzL25ldC9ldGhlcm5ldC9mYXJhZGF5L2Z0Z21hYzEwMC5jICAgICAgICAg
fCAgMiArLQo+ID4gICAuLi4vZmllbGRidXMvRG9jdW1lbnRhdGlvbi9maWVsZGJ1c19kZXYudHh0
ICAgICAgfCAgNCArKy0tCj4gPiAgIGRyaXZlcnMvdmhvc3Qvdmhvc3QuYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAyICstCj4gPiAgIGluY2x1ZGUvYWNwaS9hY3BpX2RyaXZlcnMuaCAg
ICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gPiAgIGluY2x1ZGUvbGludXgvZnNfY29udGV4
dC5oICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gPiAgIGluY2x1ZGUvbGludXgvbHNt
X2hvb2tzLmggICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gPiAgIG1tL0tjb25maWcg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gPiAgIHNlY3Vy
aXR5L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gPiAg
IHRvb2xzL2luY2x1ZGUvbGludXgvZXJyLmggICAgICAgICAgICAgICAgICAgICAgICB8ICAyICst
Cj4gPiAgIHRvb2xzL29ianRvb2wvRG9jdW1lbnRhdGlvbi9zdGFjay12YWxpZGF0aW9uLnR4dCB8
ICA0ICsrLS0KPiA+ICAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMveDg2L3Byb3RlY3Rpb25fa2V5
cy5jICAgIHwgIDIgKy0KPiA+ICAgNDggZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKSwg
NzggZGVsZXRpb25zKC0pICAKPiAKPiBbLi4uXQo+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcG93
ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcKPiA+IGluZGV4IDhjMWM2MzYzMDhj
OC4uZTg2OGQyYmQ0OGI4IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9wb3dlcnBjL0tjb25maWcKPiA+
ICsrKyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnCj4gPiBAQCAtODk4LDcgKzg5OCw3IEBAIGNvbmZp
ZyBQUENfTUVNX0tFWVMKPiA+ICAgCSAgcGFnZS1iYXNlZCBwcm90ZWN0aW9ucywgYnV0IHdpdGhv
dXQgcmVxdWlyaW5nIG1vZGlmaWNhdGlvbiBvZiB0aGUKPiA+ICAgCSAgcGFnZSB0YWJsZXMgd2hl
biBhbiBhcHBsaWNhdGlvbiBjaGFuZ2VzIHByb3RlY3Rpb24gZG9tYWlucy4KPiA+ICAgCj4gPiAt
CSAgRm9yIGRldGFpbHMsIHNlZSBEb2N1bWVudGF0aW9uL3ZtL3Byb3RlY3Rpb24ta2V5cy5yc3QK
PiA+ICsJICBGb3IgZGV0YWlscywgc2VlIERvY3VtZW50YXRpb24veDg2L3Byb3RlY3Rpb24ta2V5
cy5yc3QgIAo+IAo+IEl0IGxvb2tzIHN0cmFuZ2UgdG8gcmVmZXJlbmNlIGFuIHg4NiBmaWxlLCBm
b3IgcG93ZXJwYyBhcmNoLgoKSW5kZWVkLiBZZXQsIHNlZWtpbmcgZm9yIHRoZSBBUEkgZG9jdW1l
bnRlZCB0aGVyZToKCiAkIGdpdCBncmVwIC1sIHBrZXlfbXByb3RlY3QKRG9jdW1lbnRhdGlvbi94
ODYvcHJvdGVjdGlvbi1rZXlzLnJzdAphcmNoL2FscGhhL2tlcm5lbC9zeXNjYWxscy9zeXNjYWxs
LnRibAphcmNoL2FybS90b29scy9zeXNjYWxsLnRibAphcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Vu
aXN0ZDMyLmgKYXJjaC9pYTY0L2tlcm5lbC9zeXNjYWxscy9zeXNjYWxsLnRibAphcmNoL202OGsv
a2VybmVsL3N5c2NhbGxzL3N5c2NhbGwudGJsCmFyY2gvbWljcm9ibGF6ZS9rZXJuZWwvc3lzY2Fs
bHMvc3lzY2FsbC50YmwKYXJjaC9taXBzL2tlcm5lbC9zeXNjYWxscy9zeXNjYWxsX24zMi50YmwK
YXJjaC9taXBzL2tlcm5lbC9zeXNjYWxscy9zeXNjYWxsX242NC50YmwKYXJjaC9taXBzL2tlcm5l
bC9zeXNjYWxscy9zeXNjYWxsX28zMi50YmwKYXJjaC9wYXJpc2Mva2VybmVsL3N5c2NhbGxzL3N5
c2NhbGwudGJsCmFyY2gvcG93ZXJwYy9rZXJuZWwvc3lzY2FsbHMvc3lzY2FsbC50YmwKYXJjaC9z
MzkwL2tlcm5lbC9zeXNjYWxscy9zeXNjYWxsLnRibAphcmNoL3NoL2tlcm5lbC9zeXNjYWxscy9z
eXNjYWxsLnRibAphcmNoL3NwYXJjL2tlcm5lbC9zeXNjYWxscy9zeXNjYWxsLnRibAphcmNoL3g4
Ni9lbnRyeS9zeXNjYWxscy9zeXNjYWxsXzMyLnRibAphcmNoL3g4Ni9lbnRyeS9zeXNjYWxscy9z
eXNjYWxsXzY0LnRibAphcmNoL3h0ZW5zYS9rZXJuZWwvc3lzY2FsbHMvc3lzY2FsbC50YmwKaW5j
bHVkZS9saW51eC9zeXNjYWxscy5oCmluY2x1ZGUvdWFwaS9hc20tZ2VuZXJpYy91bmlzdGQuaApr
ZXJuZWwvc3lzX25pLmMKbW0vbXByb3RlY3QuYwp0b29scy9pbmNsdWRlL3VhcGkvYXNtLWdlbmVy
aWMvdW5pc3RkLmgKdG9vbHMvcGVyZi9hcmNoL3Bvd2VycGMvZW50cnkvc3lzY2FsbHMvc3lzY2Fs
bC50YmwKdG9vbHMvcGVyZi9hcmNoL3g4Ni9lbnRyeS9zeXNjYWxscy9zeXNjYWxsXzY0LnRibAp0
b29scy9wZXJmL2J1aWx0aW4tdHJhY2UuYwp0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy94ODYvcHJv
dGVjdGlvbl9rZXlzLmMKCkRlc3BpdGUgYmVpbmcgdXNlZCBvbiBzZXZlcmFsIGFyY2hzLCB0aGUg
b25seSBkb2N1bWVudGF0aW9uIGZvciBpdAppcyBpbnNpZGUgdGhlIHg4NiBkaXJlY3RvcnksIGFz
IGl0IHNlZW1zIHRoYXQgdGhpcyBpcyBub3QKYXJjaC1zcGVjaWZpYy4KClBlcmhhcHMgdGhlIGZp
bGUgc2hvdWxkLCBpbnN0ZWFkLCBiZSBtb3ZlZCB0byBhbm90aGVyIGJvb2suCgpUaGFua3MsCk1h
dXJvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbg==
