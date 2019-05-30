Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7B82F7E7
	for <lists.virtualization@lfdr.de>; Thu, 30 May 2019 09:28:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 35997342D;
	Thu, 30 May 2019 07:28:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BCF923261
	for <virtualization@lists.linux-foundation.org>;
	Thu, 30 May 2019 07:21:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from pokefinder.org (sauhun.de [88.99.104.3])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 3690187E
	for <virtualization@lists.linux-foundation.org>;
	Thu, 30 May 2019 07:21:18 +0000 (UTC)
Received: from localhost (unknown [91.64.182.124])
	by pokefinder.org (Postfix) with ESMTPSA id 2A8B82C360B;
	Thu, 30 May 2019 09:21:16 +0200 (CEST)
Date: Thu, 30 May 2019 09:21:14 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH 22/22] docs: fix broken documentation links
Message-ID: <20190530072110.GA1776@kunai>
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
	<f9fecacbe4ce0b2b3aed38d71ae3753f2daf3ce3.1559171394.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
In-Reply-To: <f9fecacbe4ce0b2b3aed38d71ae3753f2daf3ce3.1559171394.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Andrew Lunn <andrew@lunn.ch>, Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Will Deacon <will.deacon@arm.com>,
	Pavel Tatashin <pasha.tatashin@oracle.com>,
	Paul Mackerras <paulus@samba.org>,
	Alessia Mantegazza <amantegazza@vaga.pv.it>, Jakub Wilk <jwilk@jwilk.net>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	"Paul E. McKenney" <paulmck@linux.ibm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	James Morris <jmorris@namei.org>, linux-acpi@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	xen-devel@lists.xenproject.org,
	Alexander Popov <alex.popov@linux.com>, Qian Cai <cai@lca.pw>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Thomas Preston <thomas.preston@codethink.co.uk>,
	Thomas Gleixner <tglx@linutronix.de>, Kairui Song <kasong@redhat.com>,
	Ding Xiang <dingxiang@cmss.chinamobile.com>,
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
	Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, linux-mm@kvack.org,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Yannik Sembritzki <yannik@sembritzki.me>,
	Harry Wei <harryxiyou@gmail.com>, linux-i2c@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, YueHaibing <yuehaibing@huawei.com>,
	Robert Moore <robert.moore@intel.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Len Brown <lenb@kernel.org>, Joerg Roedel <jroedel@suse.de>,
	linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Mauro Carvalho Chehab <mchehab@infradead.org>, linux-gpio@vger.kernel.org,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
	Sean Christopherson <sean.j.christopherson@intel.com>,
	James Morse <james.morse@arm.com>, Michael Ellerman <mpe@ellerman.id.au>,
	Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	linux-pci@vger.kernel.org, Bhupesh Sharma <bhsharma@redhat.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	platform-driver-x86@vger.kernel.org,
	Quentin Perret <quentin.perret@arm.com>, linux-kselftest@vger.kernel.org,
	Alex Shi <alex.shi@linux.alibaba.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Raphael Gault <raphael.gault@arm.com>, Joel Stanley <joel@jms.id.au>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Darren Hart <dvhart@infradead.org>, linux-edac@vger.kernel.org,
	Erik Schmauss <erik.schmauss@intel.com>,
	"Serge E. Hallyn" <serge@hallyn.com>, Palmer Dabbelt <palmer@sifive.com>,
	Kees Cook <keescook@chromium.org>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	SeongJae Park <sj38.park@gmail.com>,
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
	David Howells <dhowells@redhat.com>, David Brown <david.brown@linaro.org>,
	"H. Peter Anvin" <hpa@zytor.com>, devel@driverdev.osuosl.org,
	Manfred Spraul <manfred@colorfullife.com>, x86@kernel.org,
	Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
	Andy Gross <agross@kernel.org>, Dave Young <dyoung@redhat.com>,
	devicetree@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>,
	Jerome Glisse <jglisse@redhat.com>, Rob Herring <robh+dt@kernel.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>, Dmitry Vyukov <dvyukov@google.com>,
	Luis Chamberlain <mcgrof@kernel.org>, Juergen Gross <jgross@suse.com>,
	Denis Efremov <efremov@ispras.ru>, netdev@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Changbin Du <changbin.du@intel.com>, linux-security-module@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>, Andy Shevchenko <andy@infradead.org>
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
Content-Type: multipart/mixed; boundary="===============7056596839086667031=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


--===============7056596839086667031==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2019 at 08:23:53PM -0300, Mauro Carvalho Chehab wrote:
> Mostly due to x86 and acpi conversion, several documentation
> links are still pointing to the old file. Fix them.
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Didn't I ack this already?

For the I2C part:

Reviewed-by: Wolfram Sang <wsa@the-dreams.de>


--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzvhGEACgkQFA3kzBSg
KbZPRxAAhFPNKyTqg0No7kzvML2PBj9puH4y5gi/QPmIpGm4lHZikJFOlq9rgwR+
PNNz1an8lJFTrFan9VvG36hYv4zCcWm80yw2U9xZfBOk1QRHUN5jTbC8UdGyCYh+
Vo1yR3nEWEODI3yIS8kvTwlFWENBd5YA7O4GllMR1Ink+IPkc+60ji8Rt+VNZuFp
J8tzUF5tCJlUFQYTgf8fSFvM+hA1shd0gnHRUNGKIBNLONCg9mbWBODwSfZi/VcV
5J2t00XQuI/cXPk/I5Hm1XHxQKuaV/pQmcTDkrYB/ZFkPOUxqP6PM/I5S+usHBDr
7CHd3KxR04qYdmaNac8E3NOqnN4xvGMVAGpO5mvvJ0lwSVvVsdMCETSjZ8pjfnXO
pfDKBThEmJLVp9PdG5pVz1MwHv20PXAYax1rujWRjWIFdr/E8HyoW/qurTZf/bTs
tQc63rAg5QHrF177J3WR13tZp+zpVN0KL061qk9J65j3aDMsyProevJz2RN/cQzX
3630pUKa6S/q7r/t2yfL//sGW5K1nbWj3XdtpSZKvyp8KUmEM41oi48rkwMdMGL9
aB7uRlDM/0J+WIRHeXSMJ50Yfk0rKjdAuyKbhWU9+nwgPaTxUW6KMLsRhjV1K57Y
VK46VL1PX9nHY6d5572YnbuNT5Nzxeazz5nuBYHTLFDyBkyHHL8=
=MWyf
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--

--===============7056596839086667031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7056596839086667031==--
